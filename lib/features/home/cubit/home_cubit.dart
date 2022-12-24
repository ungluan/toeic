import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:toeic/database/entities/routine_entity.dart';
import 'package:toeic/features/practice/cubit/examination_cubit.dart';
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

  HomeCubit(this.authenticationRepository, this.userRepository, this.examinationRepository, this.testRepository)
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
      if(e.type == DioErrorType.other){
      String mStr = month < 10 ? '0$month' : month.toString();
      await userRepository.getActivityFromDB(year.toString(), mStr);
      emit(const HomeState.loaded());

      }else{
        emit(HomeState.failed(e.message));
      }
    }
  }

  Future<RoutineEntity?> getRoutineFromDB(String year, String month, String date) async{
    return await userRepository.getRoutineByDateFromDB(year, month, date);
  }

  void saveDataToDB() async{
    saveData();
    saveExaminations();
    saveRoutines();
    saveUser();
    saveTests();
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

  void saveTests() async{
    var maxId = hive.maxTestId;
    var tests = await testRepository.getTestsFromMaxId(maxId);
    for (var element in tests) {
      if(maxId < element.id!) {
        maxId = element.id!;
      }
    }
    userRepository.saveAllTests(tests);
    hive.updateMaxTestId(maxId);
  }

  void saveUser() async{
    if(authenticationRepository.user!=null){
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
}
