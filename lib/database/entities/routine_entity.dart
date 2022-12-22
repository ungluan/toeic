import 'package:floor/floor.dart';
import 'package:toeic/database/entities/user_entity.dart';

@Entity(tableName: 'routine')
class RoutineEntity {
  @primaryKey
  @ColumnInfo(name: 'id')
  final int? id;

  @ColumnInfo(name: 'user_id')
  final int? userId;

  @ColumnInfo(name: 'created_at')
  final String? createdAt;

  @ColumnInfo(name: 'total_time')
  final int? totalTime;

  @ColumnInfo(name: 'number_of_practice')
  final int? numberOfPractice;

  @ColumnInfo(name: 'number_of_test')
  final int? numberOfTest;

  RoutineEntity({
    this.id,
    this.userId,
    this.createdAt,
    this.totalTime,
    this.numberOfPractice,
    this.numberOfTest,
  });
}
