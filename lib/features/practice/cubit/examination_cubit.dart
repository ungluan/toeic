import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:toeic/apis/models/Choice.dart';

import '../../../apis/models/Examination.dart';
import '../../../apis/models/Exams.dart';
import '../../../apis/models/Questions.dart';
import '../../../apis/models/Test.dart';
import '../../../repositories/authentication_repository.dart';
import '../../../repositories/examination_repository.dart';
import '../../../utils/utils.dart';

part 'examination_cubit.freezed.dart';

@injectable
class ExaminationCubit extends Cubit<ExaminationState> {
  final AuthenticationRepository authenticationRepository;
  final ExaminationRepository examinationRepository;

  ExaminationCubit(this.authenticationRepository, this.examinationRepository)
      : super(const ExaminationState.loading()) {
    _examination = examinationRepository.examination;
  }

  List<Choice>? _choices = [];

  List<Choice>? get choices => _choices;
  Examination? _examination;

  Examination? get examination => _examination;

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

  Future<void> setupTest(Test test) async {
    try {
      emit(const ExaminationState.loading());
      List<Exams>? exams = test.exams;
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

  void setupReadExamination(int examinationId) async {
    if (_examination?.id != examinationId) {
      // getExamination
      _examination = await examinationRepository.getExamination(examinationId);
      examinationRepository.examination = _examination;
    }
    try {
      // emit(const ExaminationState.loading());
      List<Exams>? exams = examination!.test!.exams;
      logger(examination);
      for (int i = 0; i < exams!.length; i++) {
        var questions = exams[i].questions;
        for (int j = 0; j < questions!.length; j++) {
          var selected = examination!.examinationsDetail!
              .firstWhere((detail) => detail.question!.id == questions[j].id!)
              .selection!;
          _choices?.add(Choice(id: questions[j].id!, selected: selected));
        }
        // emit(ExaminationState.loaded(test, choices!));
      }
    } on DioError catch (e) {
      emit(ExaminationState.failed(e.response?.statusMessage ?? ''));
    }
  }

  Future<void> startExamination(int testId) async {
    try {
      emit(const ExaminationState.loading());
      _examination = await examinationRepository.startExamination(testId);
      examinationRepository.examination = _examination;
      logger(examinationRepository.examination);
      emit(const ExaminationStateStarted());
    } on DioError catch (e) {
      emit(ExaminationState.failed(e.response?.statusMessage ?? ''));
    }
  }

  Future<void> submitExamination() async {
    Map<String, dynamic> data = {};
    for (var selected in choices ?? []) {
      data['${selected.id}'] = selected.selected;
    }
    try {
      emit(const ExaminationState.loading());
      _examination =
          await examinationRepository.submitExamination(examination!.id!, data);
      examinationRepository.examination = _examination;
      emit(const ExaminationState.submitted());
    } on DioError catch (e) {
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
// const factory ExaminationState.chooseAnswer() = ExaminationStateChooseAnswer;
}
