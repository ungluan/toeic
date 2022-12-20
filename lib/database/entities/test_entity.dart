import 'package:floor/floor.dart';
import 'package:toeic/database/entities/type_test_entity.dart';
import 'package:toeic/database/entities/user_entity.dart';

@Entity(tableName: 'level', foreignKeys: [
  ForeignKey(childColumns: ['user_id'], parentColumns: ['id'], entity: UserEntity),
  ForeignKey(childColumns: ['type_test_id'], parentColumns: ['id'], entity: TypeTestEntity),
])
class TestEntity {
  @primaryKey
  @ColumnInfo(name: 'id')
  final int? id;

  @ColumnInfo(name: 'user_id')
  final int? userId;

  @ColumnInfo(name: 'type_test_id')
  final int? typeTestId;

  @ColumnInfo(name: 'target')
  final int? target;

  @ColumnInfo(name: 'is_available')
  final bool? isAvailable;

  @ColumnInfo(name: 'created_at')
  final String? createdAt;

  TestEntity({
    this.id,
    this.userId,
    this.typeTestId,
    this.target,
    this.isAvailable,
    this.createdAt,
  });
}
