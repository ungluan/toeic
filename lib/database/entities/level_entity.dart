import 'package:floor/floor.dart';

@Entity(
  tableName: 'level',
)
class LevelEntity {
  @primaryKey
  @ColumnInfo(name: 'id')
  final int? id;

  @ColumnInfo(name: 'name')
  final String? name;

  LevelEntity({this.id, this.name});
}