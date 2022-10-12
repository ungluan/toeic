import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'token_rest_client.g.dart';

@RestApi(baseUrl: '')
abstract class TokenRestClient {
  factory TokenRestClient(Dio dio, {String baseUrl}) = _TokenRestClient;


}
