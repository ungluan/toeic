

import 'package:dio/dio.dart';

import '../apis/models/Test.dart';
import '../apis/models/user.dart';

abstract class UserRepository {
  Future<User> updateLv1( Map<String, dynamic> data);

  Future<User> saveActivityInApp();

  Future<String?> updateUserByAdmin(int userId , FormData formData);

  Future<String?> updateAvatar(FormData formData);
}