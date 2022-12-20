import 'package:floor/floor.dart';
import '../entities/type_test_entity.dart';

@dao
abstract class TypeTestDao {
  @Query('SELECT * FROM type_test')
  Future<List<TypeTestEntity>> getAllTypeTestEntity();

  @Query('SELECT * FROM type_test WHERE id = :id')
  Stream<TypeTestEntity?> findTypeTestById(int id);

  @insert
  Future<void> insertTypeTestEntity(TypeTestEntity typeTestEntity);

  @Query('DELETE FROM type_test')
  Future<void> deleteAllTypeTest();

  @Query('DELETE * FROM type_test WHERE id= :id')
  Future<void> deleteTypeTest(int id);

  @delete
  Future<void> deleteTypeTestEntity(TypeTestEntity typeTestEntity);
}