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

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertRoutineEntities(List<RoutineEntity> entities);

  @Query('DELETE FROM routine')
  Future<void> deleteAllRoutine();

  @Query('DELETE * FROM routine WHERE id= :id')
  Future<void> deleteRoutine(int id);

  @delete
  Future<void> deleteRoutineEntity(RoutineEntity routineEntity);

  @Query('''
    SELECT * FROM routine
    WHERE strftime('%m',created_at) = :month AND strftime('%Y',created_at) = :year
  ''')
  Future<List<RoutineEntity>> getActivity(String year, String month);

  @Query('''
    SELECT * FROM routine
    WHERE strftime('%m',created_at) = :month AND strftime('%Y',created_at) = :year AND strftime('%d',created_at) = :date
    LIMIT 1
  ''')
  Future<RoutineEntity?> getExaminationByDate(
      String year, String month, String date);
}
