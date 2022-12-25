import 'package:floor/floor.dart';
import '../entities/test_detail_entity.dart';

@dao
abstract class TestDetailDao {
  @Query('SELECT * FROM test_detail')
  Future<List<TestDetailEntity>> getAllTestDetailEntity();

  @Query('SELECT * FROM test_detail WHERE id = :id')
  Stream<TestDetailEntity?> findTestDetailById(int id);

  @insert
  Future<void> insertTestDetailEntity(TestDetailEntity typeTestEntity);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertTestDetailEntities(List<TestDetailEntity> entities);

  @Query('DELETE FROM test_detail')
  Future<void> deleteAllTestDetail();

  @Query('DELETE * FROM test_detail WHERE id= :id')
  Future<void> deleteTestDetail(int id);

  @delete
  Future<void> deleteTestDetailEntity(TestDetailEntity typeTestEntity);
}