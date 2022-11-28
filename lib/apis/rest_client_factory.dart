import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:toeic/apis/rest_client.dart';
import 'package:toeic/utils/utils.dart';

import '../hive/hive_service.dart';
import '../injection/injection.dart';
import 'token_rest_client.dart';

@singleton
class RestClientFactory {
  HiveService hiveService = getIt<HiveService>();

  BehaviorSubject<Exception> dioErrorSubject = BehaviorSubject();

  Stream<Exception> get dioErrorStream => dioErrorSubject.stream;

  Dio obtainTokenDio() {
    final dio = Dio();
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(responseBody: true));
    }
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      dio.interceptors.requestLock.lock();
      String accessToken = hiveService.token;
      logger(accessToken);
      options.headers["Authorization"] = "Bearer $accessToken";
      dio.interceptors.requestLock.unlock();
      if (options.data is FormData) {
        final FormData data = options.data;
        print('-------  FormData Params: ${data.fields}');
      } else {
        print('-------  Params: ${options.data}');
      }
      return handler.next(options);
    }, onError: (error, handler) {
      dioErrorSubject.add(error);
      return handler.next(error);
    }));

    return dio;
  }

  Dio obtainDio() {
    final dio = Dio();
    if (kDebugMode) dio.interceptors.add(LogInterceptor(responseBody: true));
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options);
    }, onError: (error, handler) {
      dioErrorSubject.add(error);
      return handler.next(error);
    }));
    return dio;
  }

  TokenRestClient obtainTokenRestClient() {
    return TokenRestClient(obtainTokenDio(),
        baseUrl: "https://toeci.herokuapp.com/");
  }

  RestClient obtainRestClient() {
    return RestClient(obtainDio(), baseUrl: "https://toeci.herokuapp.com/");
  }
}
