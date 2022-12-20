import 'package:dio/src/form_data.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:toeic/apis/models/DateRoutine.dart';
import 'package:toeic/apis/models/Level.dart';
import 'package:toeic/apis/models/Part.dart';
import 'package:toeic/apis/models/TypeTest.dart';
import 'package:toeic/apis/rest_client_factory.dart';

import '../../apis/models/user.dart';
import '../../apis/token_rest_client.dart';
import '../../hive/hive_service.dart';
import '../user_repository.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl extends UserRepository {
  final TokenRestClient _tokenRestClient;
  final HiveService hiveService;

  UserRepositoryImpl(RestClientFactory factory, this.hiveService)
      : _tokenRestClient = factory.obtainTokenRestClient() {
    dateActivitiesSubject.add({});
    // sumOfTestSubject.add([1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0]);
  }
  // final piechartStateSubject = BehaviorSubject<PieChartState>();
  final dateActivitiesSubject = BehaviorSubject<Map<DateTime, int>>();
  // final sumOfTestSubject = BehaviorSubject<List<double>>();

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

  // @override
  // List<double>? get sumOfTest => sumOfTestSubject.value;

  @override
  Future<List<double>> getSumOfTest() async {
    var response = await _tokenRestClient.getSumOfTest();
    var data = response.map((item) => double.parse((item.total!).toString())).toList();
    print("AAAAA: ${data}");
    // piechartStateSubject.add(PieChartStateLoaded(data));
    return data;
  }

  @override
  Future<List<double>> getSumOfTestCreated() async {
    var response = await _tokenRestClient.getSumOfTestCreated();
    var data = response.map((item) => double.parse((item.total!).toString())).toList();
    return data;
  }

  @override
  Future<double> getAverageScoreFrom3LastExamination() {
    return _tokenRestClient.getAverageScoreFrom3LastExamination();
  }

  @override
  Future<List<double>> getAverageNumberOfScoreEachPartFrom3LastExamination() {
    return _tokenRestClient.getAverageNumberOfScoreEachPartFrom3LastExamination();
  }

  @override
  Future<List<Level>> getAllLevel(int limit, int skip) {
    return _tokenRestClient.getAllLevel(limit, skip);
  }

  @override
  Future<List<Part>> getAllPart(int limit, int skip) {
    return _tokenRestClient.getAllPart(limit, skip);
  }

  @override
  Future<List<TypeTest>> getAllTypeTest(int limit, int skip) {
    return _tokenRestClient.getAllTypeTest(limit, skip);
  }

  // @override
  // Stream<PieChartState> get pieChartState => piechartStateSubject.stream;
}
