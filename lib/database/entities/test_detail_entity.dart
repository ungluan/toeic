import 'package:floor/floor.dart';
import 'package:toeic/database/entities/exam_entity.dart';
import 'package:toeic/database/entities/test_entity.dart';

@Entity(tableName: 'test_detail', foreignKeys: [
  ForeignKey(
      childColumns: ['exam_id'], parentColumns: ['id'], entity: ExamEntity),
  ForeignKey(
      childColumns: ['test_id'], parentColumns: ['id'], entity: TestEntity)
])
class TestDetailEntity {
  @primaryKey
  @ColumnInfo(name: 'id')
  final int? id;

  @ColumnInfo(name: 'test_id')
  final int? testId;

  @ColumnInfo(name: 'exam_id')
  final int? examId;

  TestDetailEntity({this.id, this.testId, this.examId});
}
