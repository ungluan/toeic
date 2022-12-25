import 'package:floor/floor.dart';

@Entity(tableName: 'examination_detail')
class ExaminationDetailEntity {
  @primaryKey
  @ColumnInfo(name: 'id')
  final int? id;

  @ColumnInfo(name: 'examination_id')
  final int? examinationId;

  @ColumnInfo(name: 'question_id')
  final int? questionId;

  @ColumnInfo(name: 'selection')
  final String? selection;

  ExaminationDetailEntity({
    this.id,
    this.examinationId,
    this.questionId,
    this.selection,
  });
}
