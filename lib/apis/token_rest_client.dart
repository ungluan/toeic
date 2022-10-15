import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'models/user.dart';


part 'token_rest_client.g.dart';

@RestApi(baseUrl: '')
abstract class TokenRestClient {
  factory TokenRestClient(Dio dio, {String baseUrl}) = _TokenRestClient;

  @GET('/user/me')
  Future<User> getUserInfo();

  @PUT('/user/update_lv1')
  Future<User> updateLv1(@Body() Map<String, dynamic> data);
}
