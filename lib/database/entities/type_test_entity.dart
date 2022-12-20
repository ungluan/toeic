import 'package:floor/floor.dart';

@Entity(
    tableName: 'type_test'
)
class TypeTestEntity {
  @primaryKey
  @ColumnInfo(name: 'id')
  final int? id;

  @ColumnInfo(name: 'name')
  final String? name;

  TypeTestEntity({this.id, this.name});
}