import 'package:dio/src/form_data.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:toeic/apis/models/DateRoutine.dart';
import 'package:toeic/apis/models/Examination.dart';
import 'package:toeic/apis/models/Level.dart';
import 'package:toeic/apis/models/Part.dart';
import 'package:toeic/apis/models/Test.dart';
import 'package:toeic/apis/models/TypeTest.dart';
import 'package:toeic/apis/rest_client_factory.dart';
import 'package:toeic/database/database_manager.dart';
import 'package:toeic/database/entities/examination_entity.dart';
import 'package:toeic/database/entities/level_entity.dart';
import 'package:toeic/database/entities/part_entity.dart';
import 'package:toeic/database/entities/routine_entity.dart';
import 'package:toeic/database/entities/test_entity.dart';
import 'package:toeic/database/entities/user_entity.dart';
import 'package:toeic/utils/utils.dart';

import '../../apis/models/Routine.dart';
import '../../apis/models/user.dart';
import '../../apis/token_rest_client.dart';
import '../../database/entities/type_test_entity.dart';
import '../../hive/hive_service.dart';
import '../user_repository.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  final TokenRestClient _tokenRestClient;
  final HiveService hiveService;
  final DatabaseProvider dbProvider;

  UserRepositoryImpl(
      RestClientFactory factory, this.hiveService, this.dbProvider)
      : _tokenRestClient = factory.obtainTokenRestClient() {
    dateActivitiesSubject.add({});
    // sumOfTestSubject.add([1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0]);
    // levelDao = dbProvider.database.levelDao;
    // partDao = dbProvider.database.partDao;
    // typeTestDao = dbProvider.database.typeTestDao;
  }

  final dateActivitiesSubject = BehaviorSubject<Map<DateTime, int>>();

  @override
  Future<User> updateLv1(Map<String, dynamic> data) {
    return _tokenRestClient.updateLv1(data);
  }

  @override
  Future<User> saveActivityInApp() {
    return _tokenRestClient.saveActivityInApp();
  }

  @override
  Future<String?> updateAvatar(FormData formData) {
    return _tokenRestClient.updateAvatar(formData);
  }

  @override
  Future<String?> updateUserByAdmin(int userId, FormData formData) {
    return _tokenRestClient.updateUserByAdmin(userId, formData);
  }

  @override
  Future<List<DateRoutine>> getActivities(int year, int month) async {
    var response = await _tokenRestClient.getActivities(year, month);
    Map<DateTime, int> map = {};
    for (var item in response) {
      var token = item.createdAt!.split('-');
      var key = DateTime(
          int.parse(token[0]), int.parse(token[1]), int.parse(token[2]));
      map.addAll({key: 1});
    }
    dateActivitiesSubject.add(map);
    return response;
  }

  @override
  Map<DateTime, int> get dateActivities => dateActivitiesSubject.value;

  @override
  Future<List<double>> getSumOfTest() async {
    var data = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
    var response = await _tokenRestClient.getSumOfTest();
    for (var item in response) {
      data[item.typeTestId! - 1] = double.parse((item.total!).toString());
    }
    logger("USER-REPOSITORY");
    response.forEach((element) {
      print(element.typeTestId.toString() + "-" + element.total!.toString());
    });
    logger(data);
    logger("USER-REPOSITORY");
    return data;
  }

  @override
  Future<List<double>> getSumOfTestCreated() async {
    var data = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
    var response = await _tokenRestClient.getSumOfTestCreated();
    for (var item in response) {
      data[item.typeTestId! - 1] = double.parse((item.total!).toString());
    }
    logger("USER-REPOSITORY-TEST-CREATED");
    logger(response);
    logger(data);
    logger("USER-REPOSITORY-TEST-CREATED");
    return data;
  }

  @override
  Future<List<double>> getNumberOfTestCreated() async {
    var data = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
    var userDao = dbProvider.database.userDao;
    var response = await userDao.getNumberOfTestCreated();
    logger("SỐ LƯỢNG ĐỀ THI ĐÃ TẠO");
    logger(response);
    response.forEach((element) {print(element);});
    logger("SỐ LƯỢNG ĐỀ THI ĐÃ TẠO");
    for (var item in response) {
      data[item.typeTestId! - 1] = double.parse((item.total!).toString());
    }

    return data;
  }

  @override
  Future<List<double>> getNumberOfUserTested() async {
    var data = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
    var userDao = dbProvider.database.userDao;
    try{
      var response = await userDao.getNumberTestOfUserTested();
      for (var item in response) {
        data[item.typeTestId! - 1] = double.parse((item.total!).toString());
      }
      logger("SỐ LƯỢNG ĐỀ THI ĐÃ THI");
      logger(response);
      logger("SỐ LƯỢNG ĐỀ THI ĐÃ THI");
    }catch(e){
      logger("LỖI KHI GỌI SỐ LƯỢNG BÀI THI ĐÃ THI TỪ DB");
      logger(e);
    }
    return data;
  }

  @override
  Future<double> getAverageScoreFrom3LastExamination() {
    return _tokenRestClient.getAverageScoreFrom3LastExamination();
  }

  @override
  Future<List<double>> getAverageNumberOfScoreEachPartFrom3LastExamination() {
    return _tokenRestClient
        .getAverageNumberOfScoreEachPartFrom3LastExamination();
  }

  @override
  Future<List<Level>> getAllLevel(int skip, int limit) {
    return _tokenRestClient.getAllLevel(limit, skip);
  }

  @override
  Future<List<Part>> getAllPart(int skip, int limit) {
    return _tokenRestClient.getAllPart(limit, skip);
  }

  @override
  Future<List<TypeTest>> getAllTypeTest(int skip, int limit) {
    return _tokenRestClient.getAllTypeTest(limit, skip);
  }

  @override
  Future<void> saveAllLevel(List<Level> levels) async {
    var levelDao = dbProvider.database.levelDao;
    var entities = levels
        .map((level) => LevelEntity(id: level.id, name: level.name))
        .toList();
    levelDao.insertLevelsEntity(entities);
  }

  @override
  Future<void> saveAllPart(List<Part> parts) async {
    var partDao = dbProvider.database.partDao;
    var entities =
        parts.map((part) => PartEntity(id: part.id, name: part.name)).toList();
    partDao.insertPartsEntity(entities);
  }

  @override
  Future<void> saveAllTypeTest(List<TypeTest> types) async {
    var typeTestDao = dbProvider.database.typeTestDao;
    var entities = types
        .map((typeTest) => TypeTestEntity(id: typeTest.id, name: typeTest.name))
        .toList();
    typeTestDao.insertTypesTestEntity(entities);
  }

  @override
  Future<List<Examination>> getExaminationByMaxId(int id) {
    return _tokenRestClient.getExaminationByMaxId(id);
  }

  @override
  Future<void> saveAllExamination(List<Examination> data) async {
    var examinationDao = dbProvider.database.examinationDao;
    var entities = data
        .map(
          (examination) => ExaminationEntity(
            id: examination.id,
            testId: examination.testId,
            userId: examination.userId,
            numberCorrectPart1: examination.numberCorrectPart1,
            numberCorrectPart2: examination.numberCorrectPart2,
            numberCorrectPart3: examination.numberCorrectPart3,
            numberCorrectPart4: examination.numberCorrectPart4,
            numberCorrectPart5: examination.numberCorrectPart5,
            numberCorrectPart6: examination.numberCorrectPart6,
            numberCorrectPart7: examination.numberCorrectPart7,
            finishedAt: examination.finishedAt,
            startedAt: examination.startedAt,
            typeTestId: examination.test?.typeTest?.id,
          ),
        )
        .toList();
    examinationDao.insertListExaminationEntity(entities);
  }

  @override
  Future<List<Routine>> getRoutineFromMaxId(int maxId) async {
    return _tokenRestClient.getRoutineFromMaxId(maxId);
  }

  @override
  Future<void> saveAllRoutine(List<Routine> data) async {
    var routineDao = dbProvider.database.routineDao;
    var entities = data
        .map((routine) => RoutineEntity(
            id: routine.id,
            userId: routine.userId,
            numberOfPractice: routine.numberOfPractice,
            numberOfTest: routine.numberOfTest,
            totalTime: routine.totalTime,
            createdAt: routine.createdAt))
        .toList();
    routineDao.insertRoutineEntities(entities);
  }

  @override
  Future<void> saveUser(User? user) async {
    var userDao = dbProvider.database.userDao;
    var entity = UserEntity(
      id: user?.id,
      firstName: user?.firstName,
      lastName: user?.lastName,
      phoneNumber: user?.phoneNumber,
      isActive: true,
      createdAt: user?.createdAt,
      address: user?.address,
      avatar: user?.avatar,
      birthDate: user?.birthDate,
      email: user?.email,
      gender: user?.gender,
      firebaseToken: '',
      password: '',
      ruleId: user?.rule?.id,
      target: user?.target,
      updatedAt: user?.updatedAt,
    );
    userDao.insertUserEntity(entity);
  }

  @override
  Future<double> getAverageScoreFrom3LastExaminationFromDB() async {
    var examinationDao = dbProvider.database.examinationDao;
    var threeLastExamination = await examinationDao.get3LastExaminationFromDB();
    double sum = 0;
    for (var examination in threeLastExamination) {
      sum += calScore(examination);
    }
    sum = double.parse((sum / threeLastExamination.length).toStringAsFixed(2));
    return sum;
  }

  @override
  Future<User?> getUserFromDb() async {
    await Future.delayed(Duration(milliseconds: 100));
    var userDao = dbProvider.database.userDao;
    var entities = await userDao.getAllUserEntity();
    if (entities.isEmpty) return null;
    var user = User(
        id: entities[0].id,
        updatedAt: entities[0].updatedAt,
        target: entities[0].target,
        gender: entities[0].gender,
        email: entities[0].email,
        birthDate: entities[0].birthDate,
        avatar: entities[0].avatar,
        address: entities[0].address,
        createdAt: entities[0].createdAt,
        isActive: entities[0].isActive,
        phoneNumber: entities[0].phoneNumber,
        lastName: entities[0].lastName,
        firstName: entities[0].firstName,
        rule: null);
    return user;
  }

  @override
  Future<void> saveAllTests(List<Test> tests) async {
    var testDao = dbProvider.database.testDao;
    logger("TEST RETURN ?");
    logger(tests);
    var entities = tests
        .map((test) => TestEntity(
              id: test.id,
              createdAt: test.createdAt,
              target: test.target,
              userId: test.userId,
              typeTestId: test.typeTestId,
              downloaded: false,
              isAvailable: true,
            ))
        .toList();
    testDao.insertTestEntities(entities);
  }

  @override
  Future<List<double>> getAverageNumberOfScoreEachPartFrom3LastExaminationFromDB() async {
    var userDao = dbProvider.database.userDao;
    var examinations = await userDao.get3TheLastExamination();
    var data = [0.0,0.0,0.0,0.0,0.0,0.0,0.0];
    for (var examination in examinations) {
      data[0] += examination.numberCorrectPart1 ?? 0 ;
      data[1] += examination.numberCorrectPart2 ?? 0 ;
      data[2] += examination.numberCorrectPart3 ?? 0 ;
      data[3] += examination.numberCorrectPart4 ?? 0 ;
      data[4] += examination.numberCorrectPart5 ?? 0 ;
      data[5] += examination.numberCorrectPart6 ?? 0 ;
      data[6] += examination.numberCorrectPart7 ?? 0 ;
    }
    return data.map((e) => e/3).toList();
  }

// @override
// Stream<PieChartState> get pieChartState => piechartStateSubject.stream;
}
