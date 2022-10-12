import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:toeic/apis/models/Verify_response.dart';

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
  AuthenticationRepositoryImpl(RestClientFactory factory, this.hiveService)
      : _tokenRestClient = factory.obtainTokenRestClient(),
        _restClient = factory.obtainRestClient();

  final TokenRestClient _tokenRestClient;
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
      // final userInfo = await getUserInfo();
      // if (userInfo.updatedAt == null) {
      //   authenticationStateSubject.add(AuthenticationState.level1());
      // } else {
          authenticationStateSubject.add(AuthenticationState.authenticated());
      // }
    } else {
      authenticationStateSubject.add(AuthenticationState.unauthenticated());
    }
  }

  @override
  Future<void> login(Map<String, dynamic> data) async {
    try {
      final response = await _restClient.login(data);
      hiveService.updateToken(response.accessToken ?? '');
      authenticationStateSubject.add(const AuthenticationState.authenticated());
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

  // Future<void> logout() async {
  //   try {
  //     final deviceId = await getDeviceId();
  //     final data = {'device_id': deviceId};
  //     await _tokenRestClient.logout(data);
  //     hiveService.clearToken();
  //     authenticationStateSubject.add(AuthenticationState.unauthenticated());
  //   } catch (e) {
  //     logger(e);
  //   }
  // }

  // @override
  // Future<DataResponse<UserResponse>> register(Map<String, dynamic> data) async {
  //   if (hiveService.inviteUserId.isNotEmpty) {
  //     data['userId'] = hiveService.inviteUserId;
  //     hiveService.clearInviteUserId();
  //   }
  //   final response = await _restClient.register(data);
  //   dataSubject.add(data);
  //   return response;
  // }
  //
  // @override
  // Future<DataResponse<String>> sendOtp(String phoneNumber, int register) {
  //   final Map<String, dynamic> data = {
  //     'phoneNumber': phoneNumber,
  //     'is_register': register
  //   };
  //   // return Future.delayed(
  //   //     Duration(milliseconds: 1000),
  //   //     () => DataResponse(
  //   //         error: false, data: "data", message: "sendOtp failed"));
  //   return _restClient.sendOtp(data);
  // }
  //
  // @override
  // Future<DataResponse<String>> verifyOtp(String otp, String phoneNumber) {
  //   final Map<String, dynamic> data = {'otp': otp, 'phone': phoneNumber};
  //   // return Future.delayed(
  //   //     Duration(milliseconds: 1000),
  //   //     () => DataResponse(
  //   //         error: false, data: "data", message: "verifyOtp failed"));
  //   return _restClient.verifyOtp(data);
  // }
  //
  // @override
  // Future<DataResponse<Object>> resetPassword(
  //     String password, String phone) async {
  //   final Map<String, dynamic> data = {
  //     'password': password,
  //     'password_confirmation': password,
  //     'phone': phone
  //   };
  //   final response = await _restClient.resetPassword(data);
  //   dataSubject.add(data);
  //   return response;
  // }

  // @override
  // Future<User> getUserInfo() async {
  //   final response = await _tokenRestClient.getUserInfo();
  //   userSubject.add(response.data);
  //   // hiveService.updateUserId(response.data.id ?? -1);
  //   return response;
  // }

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
    Map<String, dynamic> data = {
      "phone_number": phoneNumber,
      "email": email
    };
    return _restClient.checkUserExists(data);
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
