import 'package:floor/floor.dart';

@entity
class NumberOfTestEntity {
  @primaryKey
  @ColumnInfo(name: 'type_test_id')
  final int? typeTestId;

  @ColumnInfo(name: 'total')
  final int? total;

  NumberOfTestEntity({this.typeTestId, this.total});
}