import 'package:floor/floor.dart';
import 'package:toeic/database/entities/exam_entity.dart';

import '../entities/exam_entity.dart';

@dao
abstract class ExamDao {
  @Query('SELECT * FROM exam')
  Future<List<ExamEntity>> getAllExamEntity();

  @Query('SELECT * FROM exam WHERE id = :id')
  Stream<ExamEntity?> findExamById(int id);

  @insert
  Future<void> insertExamEntity(ExamEntity examEntity);

  @Query('DELETE FROM exam')
  Future<void> deleteAllExam();

  @Query('DELETE * FROM exam WHERE id= :id')
  Future<void> deleteExam(int id);

  @delete
  Future<void> deleteExamEntity(ExamEntity examEntity);
}