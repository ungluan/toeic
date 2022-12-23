// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:toeic/database/entities/examination_entity.dart';

@dao
abstract class ExaminationDao {
  @Query('SELECT * FROM examination')
  Future<List<ExaminationEntity>> getAllExaminationEntity();

  @Query('SELECT * FROM examination WHERE id = :id')
  Stream<ExaminationEntity?> findExaminationById(int id);

  @insert
  Future<void> insertExaminationEntity(ExaminationEntity examinationEntity);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertListExaminationEntity(List<ExaminationEntity> data);

  @Query('DELETE FROM examination')
  Future<void> deleteAllExamination();

  @Query('DELETE * FROM examination WHERE id= :id')
  Future<void> deleteExamination(int id);

  @delete
  Future<void> deleteExaminationEntity(ExaminationEntity examinationEntity);

  @Query('''
      SELECT * FROM examination 
      WHERE type_test_id = 8 AND
      finished_at IS NOT NULL
      ORDER BY id DESC
      LIMIT 3
  ''')
  Future<List<ExaminationEntity>> get3LastExaminationFromDB();
}