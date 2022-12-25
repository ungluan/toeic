import 'package:floor/floor.dart';
import 'package:toeic/database/entities/level_entity.dart';
import 'package:toeic/database/entities/part_entity.dart';

@Entity(tableName: 'exam')
class ExamEntity {
  @primaryKey
  @ColumnInfo(name: 'id')
  final int? id;

  @ColumnInfo(name: 'paragraph')
  final String? paragraph;

  @ColumnInfo(name: 'audio')
  final String? audio;

  @ColumnInfo(name: 'level_id')
  final int? levelId;

  @ColumnInfo(name: 'part_id')
  final int? partId;

  ExamEntity({this.paragraph, this.audio, this.levelId, this.partId, this.id});
}
