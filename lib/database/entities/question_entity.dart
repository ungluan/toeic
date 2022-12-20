import 'package:floor/floor.dart';

@Entity(tableName: 'question')
class QuestionEntity {
  @primaryKey
  @ColumnInfo(name: 'id')
  final int? id;

  @ColumnInfo(name: 'content')
  final String? content;

  @ColumnInfo(name: 'explain')
  final String? explain;

  @ColumnInfo(name: 'a')
  final String? a;

  @ColumnInfo(name: 'b')
  final String? b;

  @ColumnInfo(name: 'c')
  final String? c;

  @ColumnInfo(name: 'd')
  final String? d;

  @ColumnInfo(name: 'answer')
  final String? answer;

  @ColumnInfo(name: 'exam_id')
  final int? examId;

  QuestionEntity({
    this.id,
    this.content,
    this.explain,
    this.a,
    this.b,
    this.c,
    this.d,
    this.answer,
    this.examId,
  });
}
