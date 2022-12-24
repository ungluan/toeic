import 'package:floor/floor.dart';
import '../entities/test_entity.dart';

@dao
abstract class TestDao {
  @Query('SELECT * FROM test')
  Future<List<TestEntity>> getAllTestEntity();

  @Query('SELECT * FROM test WHERE id = :id')
  Stream<TestEntity?> findTestById(int id);

  @Query('SELECT id FROM test WHERE downloaded = true')
  Future<List<int>?> getIdsFromTestDownloaded();

  @insert
  Future<void> insertTestEntity(TestEntity testEntity);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertTestEntities(List<TestEntity> entities);

  @Query('DELETE FROM test')
  Future<void> deleteAllTest();

  @Query('DELETE * FROM test WHERE id= :id')
  Future<void> deleteTest(int id);

  @delete
  Future<void> deleteTestEntity(TestEntity testEntity);
}