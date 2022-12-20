import 'package:floor/floor.dart';

@Entity(
    tableName: 'part'
)
class PartEntity {
  @primaryKey
  @ColumnInfo(name: 'id')
  final int? id;

  @ColumnInfo(name: 'name')
  final String? name;

  PartEntity({this.id, this.name});
}