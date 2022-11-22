import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'models/Examination.dart';
import 'models/Test.dart';
import 'models/user.dart';


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
  Future<Examination> submitExamination(@Path('examination_id') int examinationId, @Body() Map<String, dynamic> data);

  @GET('/examination/{examination_id}')
  Future<Examination> getExamination(@Path('examination_id') int examinationId);

  @PUT('user/save-activity-in-app')
  Future<User> saveActivityInApp();
}
