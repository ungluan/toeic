// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:toeic/database/entities/user_entity.dart';

import '../entities/user_entity.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM user')
  Future<List<UserEntity>> getAllUserEntity();

  @Query('SELECT * FROM user WHERE id = :id')
  Stream<UserEntity?> findUserById(int id);

  @insert
  Future<void> insertUserEntity(UserEntity userEntity);

  @Query('DELETE FROM user')
  Future<void> deleteAllUser();

  @Query('DELETE * FROM user WHERE id= :id')
  Future<void> deleteUser(int id);

  @delete
  Future<void> deleteUserEntity(UserEntity userEntity);
}