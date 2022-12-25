import 'package:floor/floor.dart';

@Entity(tableName: 'test_detail')
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
