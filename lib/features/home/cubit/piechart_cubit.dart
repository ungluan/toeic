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

part 'piechart_cubit.freezed.dart';

@injectable
class PieChartCubit extends Cubit<PieChartState> {
  final UserRepository userRepository;
  final ExaminationRepository examinationRepository;


  PieChartCubit(this.userRepository, this.examinationRepository)
      : super(const PieChartState.loading()) {
    examinationRepository.testStateStream.listen((state) {
      if (state is ExaminationStateSubmitted) {}
    });
  }

  Future<void> getSumOfTest() async {
    try {
      emit(const PieChartState.loading());
      var data = await userRepository.getSumOfTest();
      emit(PieChartState.loaded(data));
    } on DioError catch (e) {
      emit(PieChartState.failed(e.message));
    }
  }
}

@freezed
class PieChartState with _$PieChartState {
  const factory PieChartState.loading() = PieChartStateLoading;

  const factory PieChartState.loaded(List<double> data) = PieChartStateLoaded;

  const factory PieChartState.failed(String error) = PieChartStateFailed;
}
