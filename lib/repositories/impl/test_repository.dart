import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:toeic/apis/models/Examination.dart';
import 'package:toeic/apis/models/Images.dart';
import 'package:toeic/apis/models/Level.dart';
import 'package:toeic/apis/models/Part.dart';
import 'package:toeic/apis/models/Question.dart';
import 'package:toeic/apis/models/Test.dart';
import 'package:toeic/apis/models/TypeTest.dart';
import 'package:toeic/database/database_manager.dart';
import 'package:toeic/database/entities/exam_entity.dart';
import 'package:toeic/database/entities/test_entity.dart';
import 'package:toeic/features/practice/cubit/test_cubit.dart';
import 'package:toeic/utils/utils.dart';

import '../../apis/models/Exams.dart';
import '../../apis/models/Questions.dart';
import '../../apis/rest_client_factory.dart';
import '../../apis/token_rest_client.dart';
import '../../hive/hive_service.dart';
import '../test_repository.dart';

@LazySingleton(as: TestRepository)
class TestRepositoryImpl extends TestRepository {

  final TokenRestClient _tokenRestClient;
  final HiveService hiveService;
  final DatabaseProvider dbProvider;
  // final BehaviorSubject<List<Test>> testsSubject = BehaviorSubject();
  // final BehaviorSubject<Map<String, dynamic>> dataSubject = BehaviorSubject();
  // final BehaviorSubject<TestState> testStateSubject =
  // BehaviorSubject();


  TestRepositoryImpl(RestClientFactory factory, this.hiveService, this.dbProvider) :
        _tokenRestClient = factory.obtainTokenRestClient();

  @override
  Future<List<Test>> getListTestByTypeTest(int typeTestId, int target) {
    return _tokenRestClient.getListTestByTypeTest(target, typeTestId);
  }

  @override
  Future<List<Examination?>> getListExaminationByTestsId(List<int> testsId) {
    return _tokenRestClient.getListExaminationByTestsId(testsId);
  }

  @override
  Future<List<Test>> getTestsFromMaxId(int maxId) {
    return _tokenRestClient.getTestsFromMaxId(maxId);
  }

  @override
  Future<List<int>> getIdsFromTestDownloaded() async {
    var testDao = dbProvider.database.testDao;
    return (await testDao.getIdsFromTestDownloaded()) ?? [];
  }

  @override
  Future<void> updateDownload(int id) async {
    var testDao = dbProvider.database.testDao;
    testDao.updateDownload(id);
  }

  @override
  Future<List<Test>> getListTestByTypeAndTargetFromDb(int typeId, int target) async {
    var testDao = dbProvider.database.testDao;
    var typeTestDao = dbProvider.database.typeTestDao;
    var examDao = dbProvider.database.examDao;
    var questionDao = dbProvider.database.questionDao;
    var imageDao = dbProvider.database.imageDao;
    var partDao = dbProvider.database.partDao;
    var levelDao = dbProvider.database.levelDao;


    var typeTestEntity = await typeTestDao.findTypeTestById(typeId);
    var testEntities = await testDao.getListTestByTypeAndTarget(typeId, target);
    List<Test> tests = [];
    await Future.forEach(testEntities, (TestEntity entity) async{
      var examEntities = await examDao.getListExamByTestId(entity.id!);
      List<Exams> exams = [];
      await Future.forEach(examEntities, (ExamEntity examEntity) async{
        var questionEntities = await questionDao.getListQuestionByExamId(examEntity.id!);
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
            images: imageEntities.map((e) => Images(
              id: e.id,
              url: e.url,
              index: e.index,
              examId: e.examId,
            )).toList(),
            questions: questionEntities.map((e) => Questions(
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
        logger("Exam");
        logger(exam.id);
        exams.add(exam);

      });
      logger("DANH SACH EXAM");
      logger(exams.map((e) => e.id).toList());
      var test = Test(
        id: entity.id,
        userId: entity.userId,
        target: entity.target,
        createdAt: entity.createdAt,
        typeTestId: entity.typeTestId,
        exams: exams,
        typeTest: TypeTest(
          id: typeTestEntity?.id,
          name: typeTestEntity?.name,
        ),
      );
      tests.add(test);
    });
    logger("FINIALY");
    logger(tests.map((e) => e.id).toList());
    return tests;
  }


  // @override
  // Stream<List<Test>> get testsStream => testsSubject.stream;
  //
  // @override
  // List<Test>? get tests => testsSubject.value;
  //
  // @override
  // Stream<Map<String, dynamic>> get dataStream => dataSubject.stream;
  //
  // @override
  // Stream<TestState> get testStateStream => testStateSubject.stream;
}