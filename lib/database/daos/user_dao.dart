// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:toeic/database/entities/number_of_test_entities.dart';
import 'package:toeic/database/entities/user_entity.dart';

import '../../apis/models/Number_of_examination.dart';
import '../entities/user_entity.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM user')
  Future<List<UserEntity>> getAllUserEntity();

  @Query('SELECT * FROM user WHERE id = :id')
  Stream<UserEntity?> findUserById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertUserEntity(UserEntity userEntity);

  @Query('DELETE FROM user')
  Future<void> deleteAllUser();

  @Query('DELETE * FROM user WHERE id= :id')
  Future<void> deleteUser(int id);

  @delete
  Future<void> deleteUserEntity(UserEntity userEntity);

  @Query('''
    SELECT COUNT(DISTINCT(examination.test_id)) AS total, type_test_id
    FROM examination
    WHERE examination.finished_at IS NOT NULL
    GROUP BY(type_test_id)
  ''')
  Future<List<NumberOfTestEntity>> getNumberTestOfUserTested();

  @Query('''
    SELECT type_test_id, COUNT(id) AS total
    FROM test
    GROUP BY (type_test_id)
    ORDER BY type_test_id ASC
  ''')
  Future<List<NumberOfTestEntity>> getNumberOfTestCreated();

}