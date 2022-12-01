import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:toeic/apis/models/Examination.dart';
import 'package:toeic/features/practice/cubit/test_cubit.dart';
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

  final BehaviorSubject<TestState> testStateSubject =
  BehaviorSubject();
  @override

  @override
  Future<Examination> startExamination(int testId) {
    return _tokenRestClient.startExamination(testId);
  }

  @override
  Future<Examination> submitExamination(int examinationId, int totalTime, Map<String, dynamic> data) {
    testStateSubject.add(TestStateLoaded());
    return _tokenRestClient.submitExamination(examinationId,totalTime, data);
  }

  @override
  Future<Examination> getExamination(int examinationId) {
    return _tokenRestClient.getExamination(examinationId);
  }

  @override
  Future<List<Examination>> getListExaminationByUser() {
    return _tokenRestClient.getListExaminationByUser();
  }

  @override
  Stream<TestState> get testStateStream => testStateSubject.stream;

  @override
  Future<List<Examination>> getHistory(int skip, int limit) {
    return _tokenRestClient.getHistory(skip, limit);
  }
}