import 'package:floor/floor.dart';

@entity
class ResultEntity {
  @primaryKey
  @ColumnInfo(name: 'part_id')
  final int? partId;

  @ColumnInfo(name: 'answer')
  final String? answer;

  ResultEntity({this.partId, this.answer});
}