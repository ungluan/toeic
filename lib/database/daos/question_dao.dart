import 'package:floor/floor.dart';
import '../entities/question_entity.dart';

@dao
abstract class QuestionDao {
  @Query('SELECT * FROM question')
  Future<List<QuestionEntity>> getAllQuestionEntity();

  @Query('SELECT * FROM question WHERE id = :id')
  Stream<QuestionEntity?> findQuestionById(int id);

  @insert
  Future<void> insertQuestionEntity(QuestionEntity questionEntity);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertQuestionEntities(List<QuestionEntity> entities);

  @Query('DELETE FROM question')
  Future<void> deleteAllQuestion();

  @Query('DELETE * FROM question WHERE id= :id')
  Future<void> deleteQuestion(int id);

  @delete
  Future<void> deleteQuestionEntity(QuestionEntity questionEntity);

  @Query('''
    SELECT *
    FROM question
    WHERE question.exam_id = :examId
    ORDER BY id ASC
  ''')
  Future<List<QuestionEntity>> getListQuestionByExamId(int examId);

  @Query('SELECT * FROM question WHERE id = :id')
  Future<QuestionEntity?> getQuestionById(int id);
}
