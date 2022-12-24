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

part 'radar_chart_cubit.freezed.dart';

@injectable
class RadarChartCubit extends Cubit<RadarChartState> {
  final UserRepository userRepository;
  final ExaminationRepository examinationRepository;

  RadarChartCubit(this.userRepository, this.examinationRepository)
      : super(const RadarChartState.loading()) {
    examinationRepository.testStateStream.listen((state) {
      if (state is ExaminationStateSubmitted) {
        getDataRadarChar();
      }
    });
  }

  Future<void> getDataRadarChar() async {
    try {
      emit(const RadarChartState.loading());
      var data = await userRepository.getAverageNumberOfScoreEachPartFrom3LastExamination();
      emit(RadarChartState.loaded(data));
    } on DioError catch (e) {
      if(e.type == DioErrorType.other){
        var data = await userRepository.getAverageNumberOfScoreEachPartFrom3LastExaminationFromDB();
        emit(RadarChartState.loaded(data));
      }else{
        emit(RadarChartState.failed(e.message));
      }
    }
  }
}

@freezed
class RadarChartState with _$RadarChartState {
  const factory RadarChartState.loading() = RadarChartStateLoading;

  const factory RadarChartState.loaded(List<double> data) = RadarChartStateLoaded;

  const factory RadarChartState.failed(String error) = RadarChartStateFailed;
}
