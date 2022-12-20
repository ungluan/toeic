import 'dart:async';

import 'package:floor/floor.dart';
import 'package:injectable/injectable.dart';
import 'package:toeic/database/daos/exam_dao.dart';
import 'package:toeic/database/entities/exam_entity.dart';
import 'package:toeic/database/entities/examination_detail_entity.dart';
import 'package:toeic/database/entities/examination_entity.dart';
import 'package:toeic/database/entities/image_entity.dart';
import 'package:toeic/database/entities/part_entity.dart';
import 'package:toeic/database/entities/question_entity.dart';
import 'package:toeic/database/entities/routine_entity.dart';
import 'package:toeic/database/entities/test_detail_entity.dart';
import 'package:toeic/database/entities/test_entity.dart';
import 'package:toeic/database/entities/type_test_entity.dart';

import 'daos/examination_dao.dart';
import 'daos/examination_detail_dao.dart';
import 'daos/image_dao.dart';
import 'daos/level_dao.dart';
import 'daos/part_dao.dart';
import 'daos/question_dao.dart';
import 'daos/routine_dao.dart';
import 'daos/test_dao.dart';
import 'daos/test_detail_dao.dart';
import 'daos/type_test_dao.dart';
import 'daos/user_dao.dart';
import 'entities/level_entity.dart';
import 'entities/user_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database_manager.g.dart';

@Database(version: 1, entities: [
  ExamEntity,
  ExaminationDetailEntity,
  ExaminationEntity,
  ImageEntity,
  LevelEntity,
  PartEntity,
  QuestionEntity,
  RoutineEntity,
  TestDetailEntity,
  TestEntity,
  TypeTestEntity,
  UserEntity
])
abstract class DatabaseManager extends FloorDatabase {
  ExamDao get examDao;

  ExaminationDao get examinationDao;

  ExaminationDetailDao get examinationDetailDao;

  ImageDao get imageDao;

  LevelDao get levelDao;

  PartDao get partDao;

  QuestionDao get questionDao;

  RoutineDao get routineDao;

  TestDao get testDao;

  TestDetailDao get testDetailDao;

  TypeTestDao get typeTestDao;

  UserDao get userDao;
}

@injectable
@lazySingleton
class DatabaseProvider {
  late DatabaseManager database;

  DatabaseProvider() {
    build();
  }

  Future<void> build() async {
    database =
        await $FloorDatabaseManager.databaseBuilder(databaseName).build();
  }
}

const databaseName = 'app_database.db';
const joinPattern = '/,/';
