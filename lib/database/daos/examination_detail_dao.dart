// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:toeic/database/entities/examination_detail_entity.dart';

@dao
abstract class ExaminationDetailDao {
  @Query('SELECT * FROM examination_detail')
  Future<List<ExaminationDetailEntity>> getAllExaminationDetailEntity();

  @Query('SELECT * FROM examination_detail WHERE id = :id')
  Stream<ExaminationDetailEntity?> findExaminationDetailById(int id);

  @insert
  Future<void> insertExaminationDetailEntity(
      ExaminationDetailEntity examinationDetailEntity);

  @Query('DELETE FROM examination_detail')
  Future<void> deleteAllExaminationDetail();

  @Query('DELETE * FROM examination_detail WHERE id= :id')
  Future<void> deleteExaminationDetail(int id);

  @delete
  Future<void> deleteExaminationDetailEntity(
      ExaminationDetailEntity examinationDetailEntity);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertExaminationDetails(List<ExaminationDetailEntity> entities);

  @Query('''
      select * 
      FROM examination_detail
      WHERE examination_detail.examination_id = :id
      ORDER BY examination_detail.id ASC
  ''')
  Future<List<ExaminationDetailEntity>> getExaminationDetailByExaminationId(int id);
}
