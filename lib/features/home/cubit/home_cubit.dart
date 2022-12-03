import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:toeic/features/practice/cubit/examination_cubit.dart';
import 'package:toeic/hive/hive_service.dart';
import 'package:toeic/injection/injection.dart';

import '../../../apis/models/Examination.dart';
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
  Map<DateTime, int>? get dateActivities => userRepository.dateActivities;

  HomeCubit(this.authenticationRepository, this.userRepository, this.examinationRepository)
      : super(const HomeState.loading()) {
    examinationRepository.testStateStream.listen((state) {
      if(state is ExaminationStateSubmitted){
      }
    });
  }

  Future<void> getActivities(int year, int month) async {
    try {
      emit(const HomeState.loading());
      await userRepository.getActivities(year, month);
      emit(const HomeState.loaded());
    } on DioError catch (e) {
      emit(HomeState.failed(e.message));
    }
  }

  // Future<void> getSumOfTest() async{
  //   try {
  //     emit(const HomeState.loading());
  //     await userRepository.getSumOfTest();
  //     emit(const HomeState.loaded());
  //     // emit(const HomeState.success());
  //   } on DioError catch (e) {
  //     emit(HomeState.failed(e.message));
  //   }
  // }

}

@freezed
class HomeState with _$HomeState {
  const factory HomeState.loading() = HomeStateLoading;
  const factory HomeState.loaded() = HomeStateLoaded;
  const factory HomeState.success() = HomeStateSuccess;
  const factory HomeState.failed(String error) = HomeStateFailed;
}
