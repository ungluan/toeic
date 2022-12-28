import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:toeic/apis/models/Choice.dart';
import 'package:toeic/database/entities/examination_detail_entity.dart';
import 'package:toeic/database/entities/examination_entity.dart';

import '../../../apis/models/Examination.dart';
import '../../../apis/models/ExaminationDetailModel.dart';
import '../../../apis/models/Exams.dart';
import '../../../apis/models/Questions.dart';
import '../../../apis/models/Test.dart';
import '../../../hive/hive_service.dart';
import '../../../repositories/authentication_repository.dart';
import '../../../repositories/examination_repository.dart';
import '../../../repositories/test_repository.dart';
import '../../../repositories/user_repository.dart';
import '../../../utils/utils.dart';

part 'examination_cubit.freezed.dart';

@injectable
class ExaminationCubit extends Cubit<ExaminationState> {
  final AuthenticationRepository authenticationRepository;
  final ExaminationRepository examinationRepository;
  final TestRepository testRepository;
  final UserRepository userRepository;
  final HiveService hiveService;

  ExaminationCubit(this.authenticationRepository, this.examinationRepository, this.testRepository, this.userRepository, this.hiveService)
      : super(const ExaminationState.loading()) {
    _examination = examinationRepository.examination;
  }

  /// Danh sách lựa chọn của bài thi
  List<Choice>? _choices = [];
  List<Choice>? get choices => _choices;
  /// Bài thi đang thi
  Examination? _examination;
  Examination? get examination => _examination;

  /// ?? Làm gì nhỉ
  Map<String, String> convertQuestionToMap(Questions question, {bool hasD = true}) {
    if(hasD){
      return {
        "a": question.a!,
        "b": question.b!,
        "c": question.c!,
        "d": question.d!,
      };
    }
    return {
      "a": question.a!,
      "b": question.b!,
      "c": question.c!,
    };
  }

  /// Lấy đáp án đã chọn theo câu hỏi
  int getSelectionNumber(int questionId) {
    for (int i = 0; i < _choices!.length; i++) {
      if (_choices![i].id == questionId) return i + 1;
    }
    return -1;
  }

  /// Chọn đáp án
  void chooseAnswer(String newSelected, int questionId) {
    _choices?.where((choice) => choice.id == questionId).first.selected =
        newSelected;
  }

  /// Setup trước khi làm bài thi
  Future<void> setupTest(Test test) async {
    try {
      emit(const ExaminationState.loading());
      /// Gán exams = danh sách các câu hỏi của đề thi
      List<Exams>? exams = test.exams;
      logger("DANH SACH CAU HOI");
      logger(exams?.map((e) => e.id).toList());
      logger("===========================");
      /// Khởi tạo danh sách lựa chọn
      for (int i = 0; i < exams!.length; i++) {
        var questions = exams[i].questions;
        for (int j = 0; j < questions!.length; j++) {
          _choices?.add(Choice(id: questions[j].id!, selected: ''));
        }
        emit(ExaminationState.loaded(test, choices!));
      }
    } on DioError catch (e) {
      emit(ExaminationState.failed(e.response?.statusMessage ?? ''));
    }
  }

  /// Setup trước khi xem chi tiết bài thi
  Future<void> setupReadExamination(int examinationId) async {
    /// Nếu chi tiết bài thi chưa có sẵn thì gọi api
    if (_examination?.id != examinationId) {
      /// Lấy chi tiết bài thi theo Id.  """ Thêm gọi local cho API này """
      _examination = await examinationRepository.getExamination(examinationId);
      /// Sắp xếp lại thứ tự câu hỏi phần
      _examination?.test?.exams?.sort((a,b)=> a.part!.id!.compareTo(b.part!.id!));
      /// Gán vào examination để đem đi hiển thị bên UI
      examinationRepository.examination = _examination;
    }
    /// Khi đã có chi tiết bài thi
    try {
      emit(const ExaminationState.loading());
      List<Exams>? exams = examination!.test!.exams;
      exams?.sort((a,b)=> a.part!.id!.compareTo(b.part!.id!));
      logger(exams);
      /// gán danh sách lựa chọn
      for (int i = 0; i < exams!.length; i++) {
        var questions = exams[i].questions;
        for (int j = 0; j < questions!.length; j++) {
          var selected = examination!.examinationsDetail!
              .firstWhere((detail) => detail.question!.id == questions[j].id!)
              .selection!;
          _choices?.add(Choice(id: questions[j].id!, selected: selected));
        }
      }
      emit(ExaminationState.loaded(examination!.test!, choices!));
    } on DioError catch (e) {
      emit(ExaminationState.failed(e.response?.statusMessage ?? ''));
    }
  }

  /// Bắt đầu bài thi
  //Todo: cần thêm gọi db ngay chổ này
  Future<void> startExamination(int testId) async {
    try {
      emit(const ExaminationState.loading());
      /// Tạo chi tiết bài thi
      _examination = await examinationRepository.startExamination(testId);
      /// Sắp xếp danh sách câu hỏi theo phần thi
      _examination?.test?.exams?.sort((a,b)=> a.part!.id!.compareTo(b.part!.id!));
      /// Lưu trữ chi tiết bài thi trong repository
      examinationRepository.examination = _examination;
      hiveService.updateIsOnline(true);
      emit(const ExaminationStateStarted());
    } on DioError catch (e) {
      /// Ngay chổ này.
      /// Gọi db: lấy examination chưa finished hoặc tạo mới 1 examination
      /// Sắp xếp lại danh sách câu hỏi theo phần nếu cần thiết
      /// lưu trữ chi tiết bài thi trong ExaminationRepository
      /// emit Success
      if(e.type == DioErrorType.other){
        var examinationHaveNotFinished = await userRepository.getExaminationHaveNotFinished(hiveService.userId, testId);
        var typeTestId = await userRepository.getTypeTestIdByTestId(testId);
        if(examinationHaveNotFinished==null){
          var entity = ExaminationEntity(
            userId: hiveService.userId,
            typeTestId: typeTestId,
            testId: testId,
            startedAt: DateTime.now().toString(),
            finishedAt: null,
            numberCorrectPart1: 0,
            numberCorrectPart2: 0,
            numberCorrectPart3: 0,
            numberCorrectPart4: 0,
            numberCorrectPart5: 0,
            numberCorrectPart6: 0,
            numberCorrectPart7: 0
          );
          await userRepository.createExaminationEntity(entity);
          var examinationEntity = await userRepository.getExaminationHaveNotFinished(hiveService.userId, testId);
          _examination = await userRepository.getExaminationByIdFromDB(examinationEntity!.id!);
          /// Sắp xếp danh sách câu hỏi theo phần thi
          _examination?.test?.exams?.sort((a,b)=> a.part!.id!.compareTo(b.part!.id!));
          /// Lưu trữ chi tiết bài thi trong repository
          examinationRepository.examination = _examination;
        }else{
          _examination = await userRepository.getExaminationByIdFromDB(examinationHaveNotFinished.id!);
          /// Sắp xếp danh sách câu hỏi theo phần thi
          _examination?.test?.exams?.sort((a,b)=> a.part!.id!.compareTo(b.part!.id!));
          /// Lưu trữ chi tiết bài thi trong repository
          examinationRepository.examination = _examination;
        }
        hiveService.updateIsOnline(false);
        emit(const ExaminationStateStarted());
      }
      else{
        emit(ExaminationState.failed(e.response?.statusMessage ?? ''));
      }
    }
  }

  /// Nộp bài
  Future<void> submitExamination(int totalTime) async {
    Map<String, dynamic> data = {};
    /// Tạo Map<questionId, selected> gửi lên Server
    for (var selected in choices ?? []) {
      data['${selected.id}'] = selected.selected;
    }
    try {
      emit(const ExaminationState.loading());
      _examination =
          await examinationRepository.submitExamination(examination!.id!, totalTime,data);
      examinationRepository.examination = _examination;
      emit(const ExaminationState.submitted());
    } on DioError catch (e) {
      /// Khi không có mạng cần lưu trữ data vào đâu?
      /// Hay là tạo danh sách chi tiết bài thi lưu vào db, tính toán điểm, Khi nào có mạng query submit lên Server
      /// Get lại examination. đem gán vào repository
      if(e.type == DioErrorType.other){
          /// 1. Tạo examination_detail
        var list = [0,0,0,0,0,0,0];
        List<ExaminationDetailModel> entities = [];
        await Future.forEach<Choice>(_choices ?? [], (Choice choice) async {
           var entity = ExaminationDetailModel(
             selection: choice.selected,
             questionId: choice.id,
             examinationId: examination?.id,
           );
           entities.add(entity);
        });
        await userRepository.insertExaminationDetails(entities);
        emit(ExaminationState.submitted());
        // /// 2. Check Đáp án
        // choices?.forEach((element) async {
        //   var result = await userRepository.getAnswerByQuestionId(element.id);
        //   if(result?.answer == element.selected){
        //     list[result!.partId! - 1] += 1;
        //   }
        // });
        //   /// 3. Cập nhật routine

      }
      emit(ExaminationState.failed(e.response?.statusMessage ?? ''));
    }
  }

  /// Lịch sử ôn luyện
  Future<void> getListExaminationByUser() async{
    try{
      emit(const ExaminationState.loading());
      var response = await examinationRepository.getListExaminationByUser();
      emit(ExaminationStateHistory(response));
    }on DioError catch(e){
      /// Gọi db lấy danh sách chi tiết bài thi
      /// Emit successful
      emit(ExaminationState.failed(e.response?.statusMessage ?? ''));
    }
  }

  /// Lấy dữ liệu bài thi gần nhất, để so sánh với bài thi này.
  Future<void> getTheLastExaminationByTypeTestId(int typeTestId) async {
    try{
      emit(const ExaminationState.loading());
      var response = await examinationRepository.getTheLastExaminationByTypeTest(typeTestId, authenticationRepository.user!.id!);
      print("DATATATA: ");
      print(response);
      emit(ExaminationState.lated(response));
    }on DioError catch(e){
      /// Gọi trong db ra
      /// emit
      emit(ExaminationState.failed(e.response?.statusMessage ?? ''));
    }
  }
}

@freezed
class ExaminationState with _$ExaminationState {
  const factory ExaminationState.loading() = ExaminationStateLoading;

  const factory ExaminationState.failed(String error) = ExaminationStateFailed;

  const factory ExaminationState.loaded(Test data, List<Choice> selections) =
      ExaminationStateLoaded;

  const factory ExaminationState.started() = ExaminationStateStarted;

  const factory ExaminationState.submitted() = ExaminationStateSubmitted;

  const factory ExaminationState.history(List<Examination> examinations) =
  ExaminationStateHistory;

  const factory ExaminationState.lated(Examination? examinationLasted) = ExaminationStateLated;
// const factory ExaminationState.chooseAnswer() = ExaminationStateChooseAnswer;
}
