import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:toeic/features/practice/cubit/examination_cubit.dart';
import 'package:toeic/hive/hive_service.dart';
import 'package:toeic/injection/injection.dart';
import 'package:toeic/utils/utils.dart';

import '../../../apis/models/Examination.dart';
import '../../../repositories/authentication_repository.dart';
import '../../../repositories/examination_repository.dart';
import '../../../repositories/user_repository.dart';

part 'barchart_cubit.freezed.dart';

@injectable
class BarChartCubit extends Cubit<BarChartState> {
  final UserRepository userRepository;
  final ExaminationRepository examinationRepository;


  BarChartCubit(this.userRepository, this.examinationRepository)
      : super(const BarChartState.loading()) {
    examinationRepository.testStateStream.listen((state) {
      if (state is ExaminationStateSubmitted) {
        getDataBarChar();
      }
    });
  }

  Future<void> getDataBarChar() async {
    logger("GỌI API BAR CHART");
    try {
      emit(const BarChartState.loading());
      var dataUser = await userRepository.getSumOfTest();
      var dataApp = await userRepository.getSumOfTestCreated();
      emit(BarChartState.loaded(dataUser, dataApp));
    } on DioError catch (e) {
      if(e.type == DioErrorType.other){
        logger("KHÔNG CÓ MẠNG");
        var dataUser = await userRepository.getNumberOfUserTested();
        var dataApp = await userRepository.getNumberOfTestCreated();
        emit(BarChartState.loaded(dataUser, dataApp));
      }else{
        emit(BarChartState.failed(e.message));
      }
    }
  }
}

@freezed
class BarChartState with _$BarChartState {
  const factory BarChartState.loading() = BarChartStateLoading;

  const factory BarChartState.loaded(List<double> dataUser, List<double> dataApp) = BarChartStateLoaded;

  const factory BarChartState.failed(String error) = BarChartStateFailed;
}
