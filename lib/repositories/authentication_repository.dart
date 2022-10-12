

import '../apis/models/user.dart';
import '../features/login/cubit/authentication_cubit.dart';

abstract class AuthenticationRepository {
  Stream<AuthenticationState> get authenticationStateStream;

  Stream<Map<String, dynamic>> get dataStream;

  Stream<User> get userStream;

  User? get user;

  Future<void> login(Map<String, dynamic> data);

  // Future<DataResponse<UserResponse>> register(Map<String, dynamic> data);

  // Future<void> logout();

  Future<void> dispatch();

  // Future<DataResponse<String>> sendOtp(String phone, int register);
  //
  // Future<DataResponse<String>> verifyOtp(String otp, String phone);
  //
  // Future<DataResponse<Object>> resetPassword(String password, String phone);
  //
  // Future<DataResponse<User>> getUserInfo();

  // void updateOnboarding(bool value);

  // Future<UserExits> checkUserExists(
  //     String username, String email, String phone, String password);
  //
  // Future<DataResponse<User>> saveToken();
  //
  // Future<DataResponse<Object>> deleteUserPhone(String phone);
  //
  // Future<DataResponse<Object>> changeNotificationSetting();
}
