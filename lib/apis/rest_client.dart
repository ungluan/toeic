import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';


part 'rest_client.g.dart';

@RestApi(baseUrl: '')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  // @POST("/auth/register")
  // Future<DataResponse<UserResponse>> register(
  //     @Body() Map<String, dynamic> data);
  //
  // @POST("/auth/login")
  // Future<DataResponse<UserResponse>> login(@Body() Map<String, dynamic> data);
  //
  // @POST("/auth/apple-login")
  // Future<DataResponse<UserResponse>> loginApple(@Body() Map<String, dynamic> data);
  //
  // @POST("/otp/send")
  // Future<DataResponse<String>> sendOtp(@Body() Map<String, dynamic> data);
  //
  // @POST("/otp/check")
  // Future<DataResponse<String>> verifyOtp(@Body() Map<String, dynamic> data);
  //
  // @PUT("/auth/reset-password")
  // Future<DataResponse<Object>> resetPassword(@Body() Map<String, dynamic> data);
  //
  // @POST('/utils/check-user-exists')
  // Future<UserExits> checkUserExists(@Body() Map<String, dynamic> data);
}
