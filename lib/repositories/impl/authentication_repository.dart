import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:toeic/apis/models/Verify_response.dart';
import 'package:toeic/repositories/user_repository.dart';

import '../../apis/models/user.dart';
import '../../apis/rest_client.dart';
import '../../apis/rest_client_factory.dart';
import '../../apis/token_rest_client.dart';
import '../../features/login/cubit/authentication_cubit.dart';
import '../../hive/hive_service.dart';
import '../../utils/utils.dart';
import '../authentication_repository.dart';

@LazySingleton(as: AuthenticationRepository)
class AuthenticationRepositoryImpl extends AuthenticationRepository {
  AuthenticationRepositoryImpl(
      RestClientFactory factory, this.hiveService, this._userRepository)
      : _tokenRestClient = factory.obtainTokenRestClient(),
        _restClient = factory.obtainRestClient();

  final TokenRestClient _tokenRestClient;
  final UserRepository _userRepository;
  final RestClient _restClient;
  final HiveService hiveService;

  // final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  final BehaviorSubject<AuthenticationState> authenticationStateSubject =
      BehaviorSubject();
  final BehaviorSubject<Map<String, dynamic>> dataSubject = BehaviorSubject();
  final BehaviorSubject<User> userSubject = BehaviorSubject();

  @override
  Stream<Map<String, dynamic>> get dataStream => dataSubject.stream;

  @override
  Stream<User> get userStream => userSubject.stream;

  @override
  Stream<AuthenticationState> get authenticationStateStream =>
      authenticationStateSubject.stream;

  @override
  Future<void> dispatch() async {
    if (hiveService.token.isNotEmpty) {
      try {
        final userInfo = await getUserInfo();
        userSubject.add(userInfo);
        // Update Routine với thời gian??
        await _userRepository.saveActivityInApp();
        if (userInfo.updatedAt == null) {
          authenticationStateSubject.add(const AuthenticationState.level1());
        } else {
          authenticationStateSubject
              .add(const AuthenticationState.authenticated());
        }
      } on DioError catch (e) {
        authenticationStateSubject
            .add(const AuthenticationState.unauthenticated());
      }
    } else {
      authenticationStateSubject
          .add(const AuthenticationState.unauthenticated());
    }
  }

  @override
  Future<void> login(Map<String, dynamic> data) async {
    try {
      final response = await _restClient.login(data);
      hiveService.updateToken(response.accessToken ?? '');
      dispatch();
      // if (response.error == false) {
      //
      // } else {
      //   authenticationStateSubject
      //       .add(AuthenticationState.failed(response.message));
      // }
    } catch (e) {
      logger(e);
      // logger(e.response?.statusCode);
      if (e is DioError && e.response?.statusCode != 500) {
        // DataResponse dataResponse = DataResponse.fromJson(e.response?.data);
        // authenticationStateSubject
        //     .add(AuthenticationState.failed(dataResponse.message));
      } else {
        authenticationStateSubject
            .add(AuthenticationState.failed(e.toString()));
      }
    }
  }

  @override
  User? get user => userSubject.value;

  // @override
  // void updateOnboarding(bool value) {
  //   hiveService.updateOnBoarding(value);
  // }
  //
  @override
  Future<VerifyResponse> checkUserExists(
      String phoneNumber, String email) async {
    Map<String, dynamic> data = {"phone_number": phoneNumber, "email": email};
    return _restClient.checkUserExists(data);
  }

  @override
  Future<String> register(Map<String, dynamic> data) {
    return _restClient.register(data);
  }

  @override
  Future<String> checkPhoneNumber(Map<String, dynamic> data) {
    return _restClient.checkPhoneNumber(data);
  }

  @override
  Future<String> checkPassword(Map<String, dynamic> data) {
    return _restClient.checkPassword(data);
  }

  @override
  Future<String> resetPassword(Map<String, dynamic> data) {
    return _restClient.resetPassword(data);
  }

  @override
  Future<User> getUserInfo() async {
    final response = await _tokenRestClient.getUserInfo();
    userSubject.add(response);
    return response;
  }
//
// @override
// Future<String> getDeviceId() async {
//   try {
//     if (Platform.isAndroid) {
//       final response = await deviceInfoPlugin.androidInfo;
//       return response.androidId ?? '';
//     } else if (Platform.isIOS) {
//       final response = await deviceInfoPlugin.iosInfo;
//       return response.identifierForVendor ?? '';
//     }
//   } catch (e) {
//     fowLog(e);
//   }
//   return '';
// }
//
// @override
// Future<DataResponse<User>> saveToken() async {
//   final deviceId = await getDeviceId();
//   Map<String, dynamic> data = {
//     'firebase_token': hiveService.firebaseToken,
//     'device_id': deviceId
//   };
//   final response = await _tokenRestClient.saveToken(data);
//   return response;
// }
//
// @override
// Future<DataResponse<Object>> deleteUserPhone(String phone) {
//   return _tokenRestClient.deleteUserPhone(phone);
// }
//
// @override
// Future<DataResponse<Object>> changeNotificationSetting() async {
//   final response = await _tokenRestClient.changeNotificationSetting();
//   await getUserInfo();
//   return response;
// }
}
