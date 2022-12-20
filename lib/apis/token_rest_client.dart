import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:toeic/apis/models/DateRoutine.dart';

import 'models/Examination.dart';
import 'models/Level.dart';
import 'models/Number_of_examination.dart';
import 'models/Test.dart';
import 'models/TypeTest.dart';
import 'models/user.dart';
import 'models/Part.dart' as pa;


part 'token_rest_client.g.dart';

@RestApi(baseUrl: '')
abstract class TokenRestClient {
  factory TokenRestClient(Dio dio, {String baseUrl}) = _TokenRestClient;

  @GET('/user/me')
  Future<User> getUserInfo();

  @PUT('/user/update_lv1')
  Future<User> updateLv1(@Body() Map<String, dynamic> data);

  @GET('/test/by-part-id-and-target')
  Future<List<Test>> getListTestByTypeTest(@Query("target") int target, @Query("type_test_id") int typeTestId);

  @POST('/examination/by-test-id')
  Future<List<Examination?>> getListExaminationByTestsId(@Body() List<int> testsId);

  @POST('/examination/start-examination')
  Future<Examination> startExamination(@Query('test_id') int testId);

  @POST('examination/submit-examination/{examination_id}')
  Future<Examination> submitExamination(@Path('examination_id') int examinationId, @Query('total_time') int totalTime, @Body() Map<String, dynamic> data);

  @GET('/examination/{examination_id}')
  Future<Examination> getExamination(@Path('examination_id') int examinationId);

  @PUT('user/save-activity-in-app')
  Future<User> saveActivityInApp();

  @GET('/examination/by-user')
  Future<List<Examination>> getListExaminationByUser();

  @PUT('/user/update-by-user')
  Future<String> updateUserByAdmin(@Query('user_id') int userId, @Body() FormData formData);

  @PATCH('/user/update-avatar')
  Future<String?> updateAvatar(@Body() FormData formData);

  @GET('/user/{user_id}')
  Future<User> getUserById(@Path('user_id') int userId);

  @GET('examination/history')
  Future<List<Examination>> getHistory(@Query('skip') int skip, @Query('limit') int limit);

  @GET('user/list-activity')
  Future<List<DateRoutine>> getActivities(@Query('year') int year, @Query('month') int month);

  @GET('user/sum-of-test')
  Future<List<NumberOfExamination>> getSumOfTest();

  @GET('user/sum-of-test-created')
  Future<List<NumberOfExamination>> getSumOfTestCreated();

  @GET('user/avg-score-from-3-last-examination')
  Future<double> getAverageScoreFrom3LastExamination();

  @GET('user/get-average-number-of-score-each-part-from-3-last-examination')
  Future<List<double>> getAverageNumberOfScoreEachPartFrom3LastExamination();

  @GET('examination/get-the-last-examination-by-type-test')
  Future<Examination?> getTheLastExaminationByTypeTest(@Query('type_test_id') int typeTestId, @Query('user_id') int userId);

  @GET('part/')
  Future<List<pa.Part>> getAllPart(@Query('limit') int limit, @Query('skip') int skip);


  @GET('level/')
  Future<List<Level>> getAllLevel(@Query('limit') int limit, @Query('skip') int skip);

  @GET('type_test/')
  Future<List<TypeTest>> getAllTypeTest(@Query('limit') int limit, @Query('skip') int skip);

}
