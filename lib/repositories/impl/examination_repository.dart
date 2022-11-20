import 'package:injectable/injectable.dart';
import 'package:toeic/apis/models/Examination.dart';
import 'package:toeic/repositories/examination_repository.dart';

import '../../apis/rest_client_factory.dart';
import '../../apis/token_rest_client.dart';
import '../../hive/hive_service.dart';

@LazySingleton(as: ExaminationRepository)
class ExaminationRepositoryImpl extends ExaminationRepository {

  final TokenRestClient _tokenRestClient;
  final HiveService hiveService;

  ExaminationRepositoryImpl(RestClientFactory factory, this.hiveService) :
        _tokenRestClient = factory.obtainTokenRestClient();

  Examination? examination;

  @override
  Future<Examination> startExamination(int testId) {
    return _tokenRestClient.startExamination(testId);
  }

  @override
  Future<Examination> submitExamination(int examinationId, Map<String, dynamic> data) {
    return _tokenRestClient.submitExamination(examinationId, data);
  }

  @override
  Future<Examination> getExamination(int examinationId) {
    return _tokenRestClient.getExamination(examinationId);
  }
}