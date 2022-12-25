// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:toeic/database/entities/level_entity.dart';

@dao
abstract class LevelDao {
  @Query('SELECT * FROM level')
  Future<List<LevelEntity>> getAllLevelEntity();

  @Query('SELECT * FROM level WHERE id = :id')
  Stream<LevelEntity?> findLevelById(int id);

  @insert
  Future<void> insertLevelEntity(LevelEntity levelEntity);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertLevelsEntity(List<LevelEntity> levelsEntity);

  @Query('DELETE FROM level')
  Future<void> deleteAllLevel();

  @Query('DELETE * FROM level WHERE id= :id')
  Future<void> deleteLevel(int id);

  @delete
  Future<void> deleteLevelEntity(LevelEntity levelEntity);

  @Query('SELECT * FROM level WHERE id = :id')
  Future<LevelEntity?> getLevelById(int id);
}