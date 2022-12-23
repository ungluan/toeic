import 'package:floor/floor.dart';
import 'package:toeic/database/entities/test_entity.dart';
import 'package:toeic/database/entities/user_entity.dart';

@Entity(tableName: 'examination')
class ExaminationEntity {
  @primaryKey
  @ColumnInfo(name: 'id')
  final int? id;

  @ColumnInfo(name: 'test_id')
  final int? testId;

  @ColumnInfo(name: 'user_id')
  final int? userId;

  @ColumnInfo(name: 'number_correct_part_1')
  final int? numberCorrectPart1;

  @ColumnInfo(name: 'number_correct_part_2')
  final int? numberCorrectPart2;

  @ColumnInfo(name: 'number_correct_part_3')
  final int? numberCorrectPart3;

  @ColumnInfo(name: 'number_correct_part_4')
  final int? numberCorrectPart4;

  @ColumnInfo(name: 'number_correct_part_5')
  final int? numberCorrectPart5;

  @ColumnInfo(name: 'number_correct_part_6')
  final int? numberCorrectPart6;

  @ColumnInfo(name: 'number_correct_part_7')
  final int? numberCorrectPart7;

  @ColumnInfo(name: 'started_at')
  final String? startedAt;

  @ColumnInfo(name: 'finished_at')
  final String? finishedAt;

  @ColumnInfo(name: 'type_test_id')
  final int? typeTestId;

  ExaminationEntity({
    this.id,
    this.testId,
    this.userId,
    this.numberCorrectPart1,
    this.numberCorrectPart2,
    this.numberCorrectPart3,
    this.numberCorrectPart4,
    this.numberCorrectPart5,
    this.numberCorrectPart6,
    this.numberCorrectPart7,
    this.startedAt,
    this.finishedAt,
    this.typeTestId
  });
}
