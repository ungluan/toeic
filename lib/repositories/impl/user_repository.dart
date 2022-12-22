import 'package:dio/src/form_data.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:toeic/apis/models/DateRoutine.dart';
import 'package:toeic/apis/models/Examination.dart';
import 'package:toeic/apis/models/Level.dart';
import 'package:toeic/apis/models/Part.dart';
import 'package:toeic/apis/models/TypeTest.dart';
import 'package:toeic/apis/rest_client_factory.dart';
import 'package:toeic/database/database_manager.dart';
import 'package:toeic/database/entities/examination_entity.dart';
import 'package:toeic/database/entities/level_entity.dart';
import 'package:toeic/database/entities/part_entity.dart';
import 'package:toeic/database/entities/routine_entity.dart';

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
    var response = await _tokenRestClient.getSumOfTest();
    var data =
        response.map((item) => double.parse((item.total!).toString())).toList();
    print("AAAAA: ${data}");
    // piechartStateSubject.add(PieChartStateLoaded(data));
    return data;
  }

  @override
  Future<List<double>> getSumOfTestCreated() async {
    var response = await _tokenRestClient.getSumOfTestCreated();
    var data =
        response.map((item) => double.parse((item.total!).toString())).toList();
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
              startedAt: examination.startedAt),
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
        .map(
          (routine) => RoutineEntity(
            id: routine.id,
            userId: routine.userId,
            numberOfPractice: routine.numberOfPractice,
            numberOfTest: routine.numberOfTest,
            totalTime: routine.totalTime,
            createdAt: routine.createdAt
          )
    ).toList();
    routineDao.insertRoutineEntities(entities);
  }

// @override
// Stream<PieChartState> get pieChartState => piechartStateSubject.stream;
}
