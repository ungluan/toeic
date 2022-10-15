

import '../apis/models/user.dart';

abstract class UserRepository {
  Future<User> updateLv1( Map<String, dynamic> data);

}