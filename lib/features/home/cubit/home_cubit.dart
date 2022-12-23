import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:toeic/features/practice/cubit/examination_cubit.dart';
import 'package:toeic/hive/hive_service.dart';
import 'package:toeic/injection/injection.dart';
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

  void saveDataToDB() async{
    saveData();
    saveExaminations();
    saveRoutines();
    saveUser();
  }

  void saveData() async {
    try{
      var types = await userRepository.getAllTypeTest(0, 100);
      var parts = await userRepository.getAllPart(0, 100);
      var levels = await userRepository.getAllLevel(0, 100);
      await userRepository.saveAllLevel(levels);
      await userRepository.saveAllPart(parts);
      await userRepository.saveAllTypeTest(types);
    } on DioError catch(e){
      logger(e);
    }
  }

  void saveExaminations() async {
    var maxId = hive.maxExaminationId;
    var examinations = await userRepository.getExaminationByMaxId(maxId);
    for (var element in examinations) {
      if(maxId < element.id!) {
        maxId = element.id!;
      }
    }
    userRepository.saveAllExamination(examinations);
    hive.updateMaxExaminationId(maxId);
  }

  void saveRoutines() async{
    var maxId = hive.maxRoutineId;
    var routines = await userRepository.getRoutineFromMaxId(maxId);
    for (var element in routines) {
      if(maxId < element.id!) {
        maxId = element.id!;
      }
    }
    userRepository.saveAllRoutine(routines);
    hive.updateMaxRoutineId(maxId);
  }

  void saveUser() async{
    userRepository.saveUser(authenticationRepository.user);
  }
}

@freezed
class HomeState with _$HomeState {
  const factory HomeState.loading() = HomeStateLoading;
  const factory HomeState.loaded() = HomeStateLoaded;
  const factory HomeState.success() = HomeStateSuccess;
  const factory HomeState.failed(String error) = HomeStateFailed;
}
