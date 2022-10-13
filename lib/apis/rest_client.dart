import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:toeic/apis/models/User_response.dart';
import 'package:toeic/apis/models/Verify_response.dart';

import 'models/user.dart';


part 'rest_client.g.dart';

@RestApi(baseUrl: '')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("/user/register")
  Future<String> register(@Body() Map<String, dynamic> data);

  @POST("/login")
  Future<UserResponse> login(@Body() Map<String, dynamic> data);

  // @POST("/auth/apple-login")
  // Future<DataResponse<UserResponse>> loginApple(@Body() Map<String, dynamic> data);
  //
  // @POST("/otp/send")
  // Future<DataResponse<String>> sendOtp(@Body() Map<String, dynamic> data);
  //
  @POST("/user/check")
  Future<String> checkPhoneNumber(@Body() Map<String, dynamic> data);

  @POST("/user/check_password")
  Future<String> checkPassword(@Body() Map<String, dynamic> data);


  @PUT("/user/reset_password")
  Future<String> resetPassword(@Body() Map<String, dynamic> data);

  @POST('/user/check_exist')
  Future<VerifyResponse> checkUserExists(@Body() Map<String, dynamic> data);
}
