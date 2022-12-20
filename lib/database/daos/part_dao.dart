import 'package:floor/floor.dart';
import '../entities/part_entity.dart';

@dao
abstract class PartDao {
  @Query('SELECT * FROM part')
  Future<List<PartEntity>> getAllPartEntity();

  @Query('SELECT * FROM part WHERE id = :id')
  Stream<PartEntity?> findPartById(int id);

  @insert
  Future<void> insertPartEntity(PartEntity partEntity);

  @Query('DELETE FROM part')
  Future<void> deleteAllPart();

  @Query('DELETE * FROM part WHERE id= :id')
  Future<void> deletePart(int id);

  @delete
  Future<void> deletePartEntity(PartEntity partEntity);
}