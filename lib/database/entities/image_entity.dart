import 'package:floor/floor.dart';
import 'package:toeic/database/entities/exam_entity.dart';

@Entity(tableName: 'image', foreignKeys: [
  ForeignKey(childColumns: ['exam_id'], parentColumns: ['id'], entity: ExamEntity),
])
class ImageEntity {
  @primaryKey
  @ColumnInfo(name: 'id')
  final int? id;

  @ColumnInfo(name: 'exam_id')
  final int? examId;

  @ColumnInfo(name: 'index')
  final int? index;

  @ColumnInfo(name: 'url')
  final String? url;

  ImageEntity({
    this.id,
    this.examId,
    this.index,
    this.url,
  });
}
