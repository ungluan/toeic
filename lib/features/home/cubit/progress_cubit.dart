import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:toeic/features/practice/cubit/examination_cubit.dart';
import 'package:toeic/hive/hive_service.dart';
import 'package:toeic/injection/injection.dart';

import '../../../apis/models/Examination.dart';
import '../../../repositories/authentication_repository.dart';
import '../../../repositories/examination_repository.dart';
import '../../../repositories/user_repository.dart';

part 'progress_cubit.freezed.dart';

@injectable
class ProgressCubit extends Cubit<ProgressState> {
  final UserRepository userRepository;
  final ExaminationRepository examinationRepository;


  ProgressCubit(this.userRepository, this.examinationRepository)
      : super(const ProgressState.loading()) {
    examinationRepository.testStateStream.listen((state) {
      if (state is ExaminationStateSubmitted) {
        getAverageScoreFrom3LastExamination();
      }
    });
  }

  Future<void> getAverageScoreFrom3LastExamination() async {
    try {
      emit(const ProgressState.loading());
      var data = await userRepository.getAverageScoreFrom3LastExamination();
      emit(ProgressState.loaded(data));
    } on DioError catch (e) {
      if(e.type == DioErrorType.other){
        var data = await userRepository.getAverageScoreFrom3LastExaminationFromDB();
        print(data);
        emit(ProgressState.loaded(data));
      }else{
        emit(ProgressState.failed(e.message));
      }
    }
  }
}

@freezed
class ProgressState with _$ProgressState {
  const factory ProgressState.loading() = ProgressStateLoading;

  const factory ProgressState.loaded(double data) = ProgressStateLoaded;

  const factory ProgressState.failed(String error) = ProgressStateFailed;
}
