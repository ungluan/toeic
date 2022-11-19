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
  List<Test> _listTest = [];

  List<Test> get listTest => _listTest;

  TestCubit(this.userRepository, this.testRepository,
      this.authenticationRepository, this.examinationRepository)
      : super(const TestState.loading());

  List<Choice>? _choices = [];

  List<Choice>? get choices => _choices;
  List<Examination?>? _examinations = [];

  List<Examination?>? get examination => _examinations;

  Map<String, String> convertQuestionToMap(Questions question) {
    return {
      "a": question.a!,
      "b": question.b!,
      "c": question.c!,
      "d": question.d!,
    };
  }

  int getSelectionNumber(int questionId) {
    for (int i = 0; i < _choices!.length; i++) {
      if (_choices![i].id == questionId) return i + 1;
    }
    return -1;
  }

  void chooseAnswer(String newSelected, int questionId) {
    _choices?.where((choice) => choice.id == questionId).first.selected =
        newSelected;
  }

  // Future<void> setupTest(int typeId) async {
  //   try {
  //       emit(const TestState.loading());
  //       // String responseStr = await rootBundle.loadString('assets/mock/part$typeId.json');
  //       var response = Test.fromJson(mock());
  //       List<Exams>? exams = response.exams;
  //       for( int i=0; i<exams!.length; i++){
  //         var questions = exams[i].questions;
  //         for( int j=0; j<questions!.length; j++){
  //           _choices?.add(Choice(id: questions[j].id! , selected: ''));
  //         }
  //       emit(TestState.loaded(data: response, selections: choices!));
  //     }
  //   } on DioError catch (e) {
  //     emit(TestState.failed(e.response?.statusMessage ?? ''));
  //   }
  // }

  Future<void> getListTestByTypeTest(int typeTestId) async {
    try {
      emit(const TestStateLoading());
      var tests = await testRepository.getListTestByTypeTest(
          typeTestId, authenticationRepository.user?.target ?? 500);
      _listTest = tests;
      _examinations =
          await getListExaminationByTestsId(tests.map((e) => e.id!).toList());
      emit(const TestStateLoaded());
    } on DioError catch (e) {
      emit(TestState.failed(e.response?.statusMessage ?? ''));
    }
  }

  Future<List<Examination?>> getListExaminationByTestsId(
      List<int> testsId) async {
    return await testRepository.getListExaminationByTestsId(testsId);
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

// const factory TestState.chooseAnswer() = TestStateChooseAnswer;
}
