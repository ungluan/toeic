import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:toeic/database/entities/exam_entity.dart';
import 'package:toeic/database/entities/image_entity.dart';
import 'package:toeic/database/entities/question_entity.dart';
import 'package:toeic/database/entities/routine_entity.dart';
import 'package:toeic/features/practice/cubit/examination_cubit.dart';
import 'package:toeic/features/practice/cubit/test_cubit.dart';
import 'package:toeic/hive/hive_service.dart';
import 'package:toeic/injection/injection.dart';
import 'package:toeic/repositories/test_repository.dart';
import 'package:toeic/utils/utils.dart';
import '../../../repositories/authentication_repository.dart';
import '../../../repositories/examination_repository.dart';
import '../../../repositories/user_repository.dart';

part 'home_cubit.freezed.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final hive = getIt<HiveService>();
  final AuthenticationRepository authenticationRepository;
  final UserRepository userRepository;
  final ExaminationRepository examinationRepository;
  final TestRepository testRepository;

  Map<DateTime, int>? get dateActivities => userRepository.dateActivities;

  HomeCubit(this.authenticationRepository, this.userRepository,
      this.examinationRepository, this.testRepository)
      : super(const HomeState.loading()) {
    examinationRepository.testStateStream.listen((state) {
      if (state is TestStateLoaded) {
        emit(HomeState.refresh());
      }
      else{
        print(state);
      }
    });
  }

  Future<void> getActivities(int year, int month) async {
    try {
      emit(const HomeState.loading());
      await userRepository.getActivities(year, month);
      emit(const HomeState.loaded());
    } on DioError catch (e) {
      if (e.type == DioErrorType.other) {
        String mStr = month < 10 ? '0$month' : month.toString();
        await userRepository.getActivityFromDB(year.toString(), mStr);
        emit(const HomeState.loaded());
      } else {
        emit(HomeState.failed(e.message));
      }
    }
  }

  Future<RoutineEntity?> getRoutineFromDB(String year, String month,
      String date) async {
    return await userRepository.getRoutineByDateFromDB(year, month, date);
  }

  void saveDataToDB() async {
    saveData();
    saveExaminations();
    saveRoutines();
    saveUser();
    saveTests();
  }

  void saveData() async {
    try {
      var types = await userRepository.getAllTypeTest(0, 100);
      var parts = await userRepository.getAllPart(0, 100);
      var levels = await userRepository.getAllLevel(0, 100);
      await userRepository.saveAllLevel(levels);
      await userRepository.saveAllPart(parts);
      await userRepository.saveAllTypeTest(types);
    } on DioError catch (e) {
      logger(e);
    }
  }

  void saveExaminations() async {
    var maxId = hive.maxExaminationId;
    var examinations = await userRepository.getExaminationByMaxId(maxId);
    var ids = examinations.map((e) => e.id!).toList();
    //
    for (var element in examinations) {
      if (maxId < element.id!) {
        maxId = element.id!;
      }
    }
    saveExaminationDetails(ids);
    userRepository.saveAllExamination(examinations);
    hive.updateMaxExaminationId(maxId);
  }

  void saveExaminationDetails(List<int> ids) async{
    var details = await userRepository.getExaminationDetailByListExaminationId(ids);
    userRepository.insertExaminationDetails(details);
  }

  void saveRoutines() async {
    var maxId = hive.maxRoutineId;
    var routines = await userRepository.getRoutineFromMaxId(maxId);
    for (var element in routines) {
      if (maxId < element.id!) {
        maxId = element.id!;
      }
    }
    userRepository.saveAllRoutine(routines);
    hive.updateMaxRoutineId(maxId);
  }

  void saveTests() async {
    var maxId = hive.maxTestId;
    var tests = await testRepository.getTestsFromMaxId(maxId);
    var ids = tests.map((e) => e.id!).toList();
    saveTestDetails(ids);
    for (var element in tests) {
      if (maxId < element.id!) {
        maxId = element.id!;
      }
    }
    userRepository.saveAllTests(tests);
    hive.updateMaxTestId(maxId);
  }

  void saveTestDetails(List<int> ids) async {
    logger("THỰC THI LƯU TEST DETAIL XUỐNG DB");
    var data = await userRepository.getListTestDetailByListTestId(ids);
    var examIds = data.map((e) => e.examId!).toList();
    saveExams(examIds);
    userRepository.insertTestDetailEntities(data);
  }

  void saveExams(List<int> ids) async {
    var data = await userRepository.getExamByListExamId(ids);
    List<ExamEntity> examEntities = [];
    List<QuestionEntity> questionEntities = [];
    List<ImageEntity> imageEntities = [];
    for (var exam in data) {
      var examEntity = ExamEntity(
          id: exam.id,
          partId: exam.part?.id,
          audio: exam.audio,
          levelId: exam.level?.id,
          paragraph: exam.paragraph
      );
      var questions = exam.questions?.map((e) => QuestionEntity(
        id: e.id,
        examId: examEntity.id,
        content: e.content,
        explain: e.explain,
        answer: e.answer,
        a: e.a,
        b: e.b,
        c: e.c,
        d: e.d,
      ));
      var images = exam.images?.map((e) => ImageEntity(
        id: e.id,
        examId: e.examId,
        index: e.index,
        url: e.url
      ));
      examEntities.add(examEntity);
      questions?.forEach((element) {questionEntities.add(element);});
      images?.forEach((element) {imageEntities.add(element);});
    }
    userRepository.insertExamEntities(examEntities);
    userRepository.insertQuestionEntities(questionEntities);
    userRepository.insertImageEntities(imageEntities);
  }

  void saveUser() async {
    if (authenticationRepository.user != null) {
      userRepository.saveUser(authenticationRepository.user);
    }
  }
}

@freezed
class HomeState with _$HomeState {
  const factory HomeState.loading() = HomeStateLoading;

  const factory HomeState.loaded() = HomeStateLoaded;

  const factory HomeState.success() = HomeStateSuccess;

  const factory HomeState.failed(String error) = HomeStateFailed;

  const factory HomeState.refresh() = HomeStateRefresh;
}
