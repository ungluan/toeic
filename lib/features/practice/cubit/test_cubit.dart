import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:toeic/apis/models/Choice.dart';
import 'package:toeic/repositories/examination_repository.dart';

import '../../../apis/models/Examination.dart';
import '../../../apis/models/Questions.dart';
import '../../../apis/models/Test.dart';
import '../../../repositories/authentication_repository.dart';
import '../../../repositories/test_repository.dart';
import '../../../repositories/user_repository.dart';

part 'test_cubit.freezed.dart';

@injectable
class TestCubit extends Cubit<TestState> {
  final UserRepository userRepository;
  final TestRepository testRepository;
  final ExaminationRepository examinationRepository;
  final AuthenticationRepository authenticationRepository;

  /// Danh sách đề thi
  List<Test> _listTest = [];

  List<Test> get listTest => _listTest;

  /// * Danh sách lựa chọn ***/
  List<Choice>? _choices = [];

  List<Choice>? get choices => _choices;

  /// * Danh sách bài thi ***/
  List<Examination?>? _examinations = [];

  List<Examination?>? get examination => _examinations;

  /// Danh sách đề thi đã tải xuống
  List<int> _idsDownloaded = [];

  TestCubit(this.userRepository, this.testRepository,
      this.authenticationRepository, this.examinationRepository)
      : super(const TestState.loading()) {
    examinationRepository.testStateStream.listen((event) {
      if (event is TestStateLoaded) {
        /// Lắng nghe khi nộp bài thành công thì sẽ cập nhật lại UI
        getListTestByTypeTest(_listTest.first.typeTest?.id ?? 1);
      }
    });
  }

  Map<String, String> convertQuestionToMap(Questions question) {
    return {
      "a": question.a!,
      "b": question.b!,
      "c": question.c!,
      "d": question.d!,
    };
  }

  /// * Lấy đáp án đã chọn theo câu hỏi ***/
  int getSelectionNumber(int questionId) {
    for (int i = 0; i < _choices!.length; i++) {
      if (_choices![i].id == questionId) return i + 1;
    }
    return -1;
  }

  /// * Chọn đáp án ***/
  void chooseAnswer(String newSelected, int questionId) {
    _choices?.where((choice) => choice.id == questionId).first.selected =
        newSelected;
  }

  /// * API lấy danh sách bài thi theo "Loại" và "Mục tiêu" ***/
  Future<void> getListTestByTypeTest(int typeTestId) async {
    try {
      emit(const TestStateLoading());
      var tests = await testRepository.getListTestByTypeTest(
          typeTestId, authenticationRepository.user?.target ?? 500);

      /// * Gán kết quả trả về cho _listTest ***/
      _listTest = tests;

      /// * Lấy danh sách các ôn luyện cùng TypeTest gần nhất để hiển thị lịch sử
      _examinations =
          await getListExaminationByTestsId(tests.map((e) => e.id!).toList());
      emit(const TestStateLoaded());
    } on DioError catch (e) {
      emit(TestState.failed(e.response?.statusMessage ?? ''));
    }
  }

  /// !Importance cần thêm try catch
  Future<List<Examination?>> getListExaminationByTestsId(
      List<int> testsId) async {
    return await testRepository.getListExaminationByTestsId(testsId);
  }

  Future<void> getIdsFromTestDownloaded() async {
    _idsDownloaded = await testRepository.getIdsFromTestDownloaded();
  }

  bool isDownloaded(int testId){
    return _idsDownloaded.contains(testId);
  }

// Nộp bài
// Xem lại bài thi
// Thi lại
}

@freezed
class TestState with _$TestState {
  const factory TestState.loading() = TestStateLoading;

  const factory TestState.failed(String error) = TestStateFailed;

  const factory TestState.loaded() = TestStateLoaded;
}
