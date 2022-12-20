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

  @Query('DELETE FROM question')
  Future<void> deleteAllQuestion();

  @Query('DELETE * FROM question WHERE id= :id')
  Future<void> deleteQuestion(int id);

  @delete
  Future<void> deleteQuestionEntity(QuestionEntity questionEntity);
}