import 'dart:math';

import 'package:dio/src/form_data.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:toeic/apis/models/DateRoutine.dart';
import 'package:toeic/apis/models/Examination.dart';
import 'package:toeic/apis/models/ExaminationDetail.dart';
import 'package:toeic/apis/models/ExaminationDetailModel.dart';
import 'package:toeic/apis/models/Exams.dart';
import 'package:toeic/apis/models/Level.dart';
import 'package:toeic/apis/models/Part.dart';
import 'package:toeic/apis/models/Test.dart';
import 'package:toeic/apis/models/TestDetail.dart';
import 'package:toeic/apis/models/TypeTest.dart';
import 'package:toeic/apis/rest_client_factory.dart';
import 'package:toeic/database/database_manager.dart';
import 'package:toeic/database/entities/exam_entity.dart';
import 'package:toeic/database/entities/examination_detail_entity.dart';
import 'package:toeic/database/entities/examination_entity.dart';
import 'package:toeic/database/entities/image_entity.dart';
import 'package:toeic/database/entities/level_entity.dart';
import 'package:toeic/database/entities/part_entity.dart';
import 'package:toeic/database/entities/question_entity.dart';
import 'package:toeic/database/entities/routine_entity.dart';
import 'package:toeic/database/entities/test_detail_entity.dart';
import 'package:toeic/database/entities/test_entity.dart';
import 'package:toeic/database/entities/user_entity.dart';
import 'package:toeic/utils/utils.dart';

import '../../apis/models/Images.dart';
import '../../apis/models/Question.dart';
import '../../apis/models/Questions.dart';
import '../../apis/models/Routine.dart';
import '../../apis/models/user.dart';
import '../../apis/models/User.dart' as Upper ;

import '../../apis/token_rest_client.dart';
import '../../database/entities/type_test_entity.dart';
import '../../hive/hive_service.dart';
import '../user_repository.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  final TokenRestClient _tokenRestClient;
  final HiveService hiveService;
  final DatabaseProvider dbProvider;

  UserRepositoryImpl(RestClientFactory factory, this.hiveService,
      this.dbProvider)
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
    response.forEach((element) {
      print(element);
    });
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
    try {
      var response = await userDao.getNumberTestOfUserTested();
      for (var item in response) {
        data[item.typeTestId! - 1] = double.parse((item.total!).toString());
      }
      logger("SỐ LƯỢNG ĐỀ THI ĐÃ THI");
      logger(response);
      logger("SỐ LƯỢNG ĐỀ THI ĐÃ THI");
    } catch (e) {
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
          (examination) =>
          ExaminationEntity(
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
        .map((routine) =>
        RoutineEntity(
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
        .map((test) =>
        TestEntity(
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
  Future<List<
      double>> getAverageNumberOfScoreEachPartFrom3LastExaminationFromDB() async {
    var userDao = dbProvider.database.userDao;
    var examinations = await userDao.get3TheLastExamination();
    var data = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
    for (var examination in examinations) {
      data[0] += examination.numberCorrectPart1 ?? 0;
      data[1] += examination.numberCorrectPart2 ?? 0;
      data[2] += examination.numberCorrectPart3 ?? 0;
      data[3] += examination.numberCorrectPart4 ?? 0;
      data[4] += examination.numberCorrectPart5 ?? 0;
      data[5] += examination.numberCorrectPart6 ?? 0;
      data[6] += examination.numberCorrectPart7 ?? 0;
    }
    return data.map((e) => e / 3).toList();
  }

  @override
  Future<void> getActivityFromDB(String year, String month) async {
    var routineDao = dbProvider.database.routineDao;
    var routines = await routineDao.getActivity(year, month);
    logger("Activity");
    Map<DateTime, int> map = {};
    for (var item in routines) {
      var token = item.createdAt!.split('T')[0].split('-');
      var key = DateTime(
          int.parse(token[0]), int.parse(token[1]), int.parse(token[2]));
      print(key);
      map.addAll({key: 1});
    }
    logger("Activity");

    dateActivitiesSubject.add(map);
  }

  @override
  Future<RoutineEntity?> getRoutineByDateFromDB(String year, String month,
      String date) async {
    var routineDao = dbProvider.database.routineDao;
    var entities = await routineDao.getExaminationByDate(year, month, date);
    return entities;
  }

  @override
  Future<List<TestDetail>> getListTestDetailByListTestId(List<int> data) {
    return _tokenRestClient.getListTestDetailByListTestId(data);
  }

  @override
  Future<void> insertTestDetailEntities(List<TestDetail> testDetails) async {
    var testDetailDao = dbProvider.database.testDetailDao;
    var entities = testDetails.map((e) =>
        TestDetailEntity(id: e.id, testId: e.testId, examId: e.examId))
        .toList();
    testDetailDao.insertTestDetailEntities(entities);
  }

  @override
  Future<List<Exams>> getExamByListExamId(List<int> data) {
    return _tokenRestClient.getExamByListExamId(data);
  }

  @override
  Future<void> insertExamEntities(List<ExamEntity> data) async {
    var examDao = dbProvider.database.examDao;
    examDao.insertExamEntities(data);
  }

  @override
  Future<void> insertImageEntities(List<ImageEntity> data) async {
    var imageDao = dbProvider.database.imageDao;
    imageDao.insertImageEntities(data);
  }

  @override
  Future<void> insertQuestionEntities(List<QuestionEntity> data) async {
    var questionDao = dbProvider.database.questionDao;
    questionDao.insertQuestionEntities(data);
  }

  @override
  Future<List<ExamEntity>> getListExamByTestId(int testId) async {
    var examDao = dbProvider.database.examDao;
    return examDao.getListExamByTestId(testId);
  }

  @override
  Future<UserEntity?> getUserById(int id) async {
    var userDao = dbProvider.database.userDao;
    return userDao.getUserById(id);
  }

  @override
  Future<List<ExaminationDetailModel>> getExaminationDetailByListExaminationId(
      List<int> data) {
    return _tokenRestClient.getExaminationByListExaminationId(data);
  }

  @override
  Future<void> insertExaminationDetails(
      List<ExaminationDetailModel> data) async {
    var examinationDetailDao = dbProvider.database.examinationDetailDao;
    var entities = data.map((e) =>
        ExaminationDetailEntity(
          id: e.id,
          examinationId: e.examinationId,
          questionId: e.questionId,
          selection: e.selection,
        )).toList();
    examinationDetailDao.insertExaminationDetails(entities);
  }

  @override
  Future<Examination?> getTheLastExaminationByTestId(int testId) async {
    var examinationDao = dbProvider.database.examinationDao;
    var examinationDetailDao = dbProvider.database.examinationDetailDao;
    var questionDao = dbProvider.database.questionDao;
    var test = await getTestByTestIdFromDB(testId);
    var userEntity = await getUserById(hiveService.userId);
    Upper.User? myUser = userEntity != null ? Upper.User(
      id: userEntity.id,
      createdAt: userEntity.createdAt,
      target: userEntity.target,
      firstName: userEntity.firstName,
      lastName: userEntity.lastName,
      phoneNumber: userEntity.phoneNumber,
      isActive: userEntity.isActive,
      address: userEntity.address,
      avatar: userEntity.avatar,
      birthDate: userEntity.birthDate,
      email: userEntity.email,
      gender: userEntity.gender,
      updatedAt: userEntity.updatedAt,
    ) : null;
    var entity = await examinationDao.getTheLastExaminationByTestId(testId);
    if(entity == null) return null;
    var examinationDetailEntities = await examinationDetailDao.getExaminationDetailByExaminationId(entity.id!);
    List<ExaminationDetail> examinationDetails = [];
    await Future.forEach(examinationDetailEntities, (ExaminationDetailEntity element) async{
      var questionEntity = await questionDao.getQuestionById(element.questionId!);
      Question? question =  Question(
          id: questionEntity?.id,
          explain: questionEntity?.explain,
          answer: questionEntity?.answer,
          content: questionEntity?.content,
          a: questionEntity?.a,
          b: questionEntity?.b,
          c: questionEntity?.c,
          d: questionEntity?.d
      );
      var detail = ExaminationDetail(
        id: element.id,
        examinationId: element.examinationId,
        question: question,
        selection: element.selection,
      );
      examinationDetails.add(detail);
    });
    var examination = Examination(
      id: entity.id,
      userId: entity.userId,
      testId: entity.testId,
      startedAt: entity.startedAt,
      finishedAt: entity.finishedAt,
      numberCorrectPart1: entity.numberCorrectPart1,
      numberCorrectPart2: entity.numberCorrectPart2,
      numberCorrectPart3: entity.numberCorrectPart3,
      numberCorrectPart4: entity.numberCorrectPart4,
      numberCorrectPart5: entity.numberCorrectPart5,
      numberCorrectPart6: entity.numberCorrectPart6,
      numberCorrectPart7: entity.numberCorrectPart7,
      user: myUser,
      test: test,
      examinationsDetail: examinationDetails,
    );
    logger("DATANEED");
    logger(examination.id);
    return examination;
  }

  Future<Test?> getTestByTestIdFromDB(int testId) async {
    var testDao = dbProvider.database.testDao;
    var typeTestDao = dbProvider.database.typeTestDao;
    var examDao = dbProvider.database.examDao;
    var questionDao = dbProvider.database.questionDao;
    var imageDao = dbProvider.database.imageDao;
    var partDao = dbProvider.database.partDao;
    var levelDao = dbProvider.database.levelDao;

    var testEntity = await testDao.getTestById(testId);
    if (testEntity == null) return null;
    var typeTestEntity = await typeTestDao.findTypeTestById(
        testEntity.typeTestId!);

    var examEntities = await examDao.getListExamByTestId(testId);
    List<Exams> exams = [];
    examEntities.forEach((examEntity) async {
      var questionEntities = await questionDao.getListQuestionByExamId(
          examEntity.id!);
      var imageEntities = await imageDao.getListImageByExamId(examEntity.id!);
      var partEntity = await partDao.getPartById(examEntity.partId!);
      var levelEntity = await levelDao.getLevelById(examEntity.levelId!);
      var exam = Exams(
          id: examEntity.id,
          paragraph: examEntity.paragraph,
          audio: examEntity.audio,
          part: Part(
            id: partEntity?.id,
            name: partEntity?.name,
          ),
          level: Level(
              id: levelEntity?.id,
              name: levelEntity?.name
          ),
          images: imageEntities.map((e) =>
              Images(
                id: e.id,
                url: e.url,
                index: e.index,
                examId: e.examId,
              )).toList(),
          questions: questionEntities.map((e) =>
              Questions(
                id: e.id,
                content: e.content,
                explain: e.explain,
                answer: e.answer,
                a: e.a,
                b: e.b,
                c: e.c,
                d: e.d,
              )).toList()
      );
      exams.add(exam);
    });
    var test = Test(
      id: testEntity.id,
      userId: testEntity.userId,
      target: testEntity.target,
      createdAt: testEntity.createdAt,
      typeTestId: testEntity.typeTestId,
      exams: exams,
      typeTest: TypeTest(
        id: typeTestEntity?.id,
        name: typeTestEntity?.name,
      ),
    );
    return test;
  }
// @override
// Stream<PieChartState> get pieChartState => piechartStateSubject.stream;
}
