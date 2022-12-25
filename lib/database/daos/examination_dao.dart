// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:toeic/database/entities/examination_entity.dart';

@dao
abstract class ExaminationDao {
  @Query('SELECT * FROM examination')
  Future<List<ExaminationEntity>> getAllExaminationEntity();

  @Query('SELECT * FROM examination WHERE id = :id')
  Stream<ExaminationEntity?> findExaminationById(int id);

  @Query('SELECT * FROM examination WHERE id = :id')
  Future<ExaminationEntity?> getExaminationByIdFromDB(int id);

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

  @Query('''
      select * 
      FROM examination
      WHERE test_id = :testId AND examination.finished_at IS NOT NULL
      ORDER BY examination.id DESC
      LIMIT 1
  ''')
  Future<ExaminationEntity?> getTheLastExaminationByTestId(int testId);

  @Query('''
    SELECT * FROM examination
    WHERE examination.user_id = :userId AND examination.finished_at IS NOT NULL AND examination.test_id = :testId
    ORDER BY examination.id DESC
    LIMIT 1
  ''')
  Future<ExaminationEntity?> getExaminationHaveNotFinished(int userId, int testId);
}