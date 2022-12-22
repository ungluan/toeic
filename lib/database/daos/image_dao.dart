// dao/person_dao.dart

import 'package:floor/floor.dart';
import 'package:toeic/database/entities/image_entity.dart';

@dao
abstract class ImageDao {
  @Query('SELECT * FROM image')
  Future<List<ImageEntity>> getAllImageEntity();

  @Query('SELECT * FROM image WHERE id = :id')
  Stream<ImageEntity?> findImageById(int id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertImageEntity(ImageEntity imageEntity);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertImagesEntity(List<ImageEntity> imagesEntity);

  @Query('DELETE FROM image')
  Future<void> deleteAllImage();

  @Query('DELETE * FROM image WHERE id= :id')
  Future<void> deleteImage(int id);

  @delete
  Future<void> deleteImageEntity(ImageEntity imageEntity);
}