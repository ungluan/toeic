import 'package:floor/floor.dart';
import '../entities/routine_entity.dart';

@dao
abstract class RoutineDao {
  @Query('SELECT * FROM routine')
  Future<List<RoutineEntity>> getAllRoutineEntity();

  @Query('SELECT * FROM routine WHERE id = :id')
  Stream<RoutineEntity?> findRoutineById(int id);

  @insert
  Future<void> insertRoutineEntity(RoutineEntity routineEntity);

  @Query('DELETE FROM routine')
  Future<void> deleteAllRoutine();

  @Query('DELETE * FROM routine WHERE id= :id')
  Future<void> deleteRoutine(int id);

  @delete
  Future<void> deleteRoutineEntity(RoutineEntity routineEntity);
}