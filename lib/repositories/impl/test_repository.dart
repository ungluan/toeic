import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:toeic/apis/models/Examination.dart';
import 'package:toeic/apis/models/Test.dart';
import 'package:toeic/database/database_manager.dart';
import 'package:toeic/database/entities/test_entity.dart';
import 'package:toeic/features/practice/cubit/test_cubit.dart';

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