import 'package:injectable/injectable.dart';
import 'package:toeic/apis/models/Examination.dart';
import 'package:toeic/apis/models/Test.dart';

import '../../apis/rest_client_factory.dart';
import '../../apis/token_rest_client.dart';
import '../../hive/hive_service.dart';
import '../test_repository.dart';

@LazySingleton(as: TestRepository)
class TestRepositoryImpl extends TestRepository {

  final TokenRestClient _tokenRestClient;
  final HiveService hiveService;

  TestRepositoryImpl(RestClientFactory factory, this.hiveService) :
        _tokenRestClient = factory.obtainTokenRestClient();

  @override
  Future<List<Test>> getListTestByTypeTest(int typeTestId, int target) {
    return _tokenRestClient.getListTestByTypeTest(target, typeTestId);
  }

  @override
  Future<List<Examination?>> getListExaminationByTestsId(List<int> testsId) {
    return _tokenRestClient.getListExaminationByTestsId(testsId);
  }

}