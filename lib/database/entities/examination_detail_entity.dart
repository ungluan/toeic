import 'package:floor/floor.dart';
import 'package:toeic/database/entities/question_entity.dart';

import 'examination_entity.dart';

@Entity(tableName: 'examination_detail',
    foreignKeys: [
      ForeignKey(childColumns: ['examination_id'], parentColumns: ['id'], entity: ExaminationEntity),
      ForeignKey(childColumns: ['question_id'], parentColumns: ['id'], entity: QuestionEntity),
    ]
)
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
