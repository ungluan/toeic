// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_manager.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorDatabaseManager {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DatabaseManagerBuilder databaseBuilder(String name) =>
      _$DatabaseManagerBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$DatabaseManagerBuilder inMemoryDatabaseBuilder() =>
      _$DatabaseManagerBuilder(null);
}

class _$DatabaseManagerBuilder {
  _$DatabaseManagerBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$DatabaseManagerBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$DatabaseManagerBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<DatabaseManager> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$DatabaseManager();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$DatabaseManager extends DatabaseManager {
  _$DatabaseManager([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ExamDao? _examDaoInstance;

  ExaminationDao? _examinationDaoInstance;

  ExaminationDetailDao? _examinationDetailDaoInstance;

  ImageDao? _imageDaoInstance;

  LevelDao? _levelDaoInstance;

  PartDao? _partDaoInstance;

  QuestionDao? _questionDaoInstance;

  RoutineDao? _routineDaoInstance;

  TestDao? _testDaoInstance;

  TestDetailDao? _testDetailDaoInstance;

  TypeTestDao? _typeTestDaoInstance;

  UserDao? _userDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 8,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `exam` (`id` INTEGER, `paragraph` TEXT, `audio` TEXT, `level_id` INTEGER, `part_id` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `examination_detail` (`id` INTEGER, `examination_id` INTEGER, `question_id` INTEGER, `selection` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `examination` (`id` INTEGER, `test_id` INTEGER, `user_id` INTEGER, `number_correct_part_1` INTEGER, `number_correct_part_2` INTEGER, `number_correct_part_3` INTEGER, `number_correct_part_4` INTEGER, `number_correct_part_5` INTEGER, `number_correct_part_6` INTEGER, `number_correct_part_7` INTEGER, `started_at` TEXT, `finished_at` TEXT, `type_test_id` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `image` (`id` INTEGER, `exam_id` INTEGER, `index` INTEGER, `url` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `level` (`id` INTEGER, `name` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `level` (`id` INTEGER, `name` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `part` (`id` INTEGER, `name` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `question` (`id` INTEGER, `content` TEXT, `explain` TEXT, `a` TEXT, `b` TEXT, `c` TEXT, `d` TEXT, `answer` TEXT, `exam_id` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `routine` (`id` INTEGER, `user_id` INTEGER, `created_at` TEXT, `total_time` INTEGER, `number_of_practice` INTEGER, `number_of_test` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `test_detail` (`id` INTEGER, `test_id` INTEGER, `exam_id` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `test` (`id` INTEGER, `user_id` INTEGER, `type_test_id` INTEGER, `target` INTEGER, `is_available` INTEGER, `created_at` TEXT, `downloaded` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `type_test` (`id` INTEGER, `name` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `user` (`id` INTEGER, `first_name` TEXT, `last_name` TEXT, `email` TEXT, `password` TEXT, `birth_date` TEXT, `address` TEXT, `phone_number` TEXT, `gender` TEXT, `avatar` TEXT, `is_active` INTEGER, `rule_id` INTEGER, `target` INTEGER, `firebase_token` TEXT, `created_at` TEXT, `updated_at` TEXT, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `NumberOfTestEntity` (`type_test_id` INTEGER, `total` INTEGER, PRIMARY KEY (`type_test_id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ExamDao get examDao {
    return _examDaoInstance ??= _$ExamDao(database, changeListener);
  }

  @override
  ExaminationDao get examinationDao {
    return _examinationDaoInstance ??=
        _$ExaminationDao(database, changeListener);
  }

  @override
  ExaminationDetailDao get examinationDetailDao {
    return _examinationDetailDaoInstance ??=
        _$ExaminationDetailDao(database, changeListener);
  }

  @override
  ImageDao get imageDao {
    return _imageDaoInstance ??= _$ImageDao(database, changeListener);
  }

  @override
  LevelDao get levelDao {
    return _levelDaoInstance ??= _$LevelDao(database, changeListener);
  }

  @override
  PartDao get partDao {
    return _partDaoInstance ??= _$PartDao(database, changeListener);
  }

  @override
  QuestionDao get questionDao {
    return _questionDaoInstance ??= _$QuestionDao(database, changeListener);
  }

  @override
  RoutineDao get routineDao {
    return _routineDaoInstance ??= _$RoutineDao(database, changeListener);
  }

  @override
  TestDao get testDao {
    return _testDaoInstance ??= _$TestDao(database, changeListener);
  }

  @override
  TestDetailDao get testDetailDao {
    return _testDetailDaoInstance ??= _$TestDetailDao(database, changeListener);
  }

  @override
  TypeTestDao get typeTestDao {
    return _typeTestDaoInstance ??= _$TypeTestDao(database, changeListener);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }
}

class _$ExamDao extends ExamDao {
  _$ExamDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _examEntityInsertionAdapter = InsertionAdapter(
            database,
            'exam',
            (ExamEntity item) => <String, Object?>{
                  'id': item.id,
                  'paragraph': item.paragraph,
                  'audio': item.audio,
                  'level_id': item.levelId,
                  'part_id': item.partId
                },
            changeListener),
        _examEntityDeletionAdapter = DeletionAdapter(
            database,
            'exam',
            ['id'],
            (ExamEntity item) => <String, Object?>{
                  'id': item.id,
                  'paragraph': item.paragraph,
                  'audio': item.audio,
                  'level_id': item.levelId,
                  'part_id': item.partId
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ExamEntity> _examEntityInsertionAdapter;

  final DeletionAdapter<ExamEntity> _examEntityDeletionAdapter;

  @override
  Future<List<ExamEntity>> getAllExamEntity() async {
    return _queryAdapter.queryList('SELECT * FROM exam',
        mapper: (Map<String, Object?> row) => ExamEntity(
            paragraph: row['paragraph'] as String?,
            audio: row['audio'] as String?,
            levelId: row['level_id'] as int?,
            partId: row['part_id'] as int?,
            id: row['id'] as int?));
  }

  @override
  Stream<ExamEntity?> findExamById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM exam WHERE id = ?1',
        mapper: (Map<String, Object?> row) => ExamEntity(
            paragraph: row['paragraph'] as String?,
            audio: row['audio'] as String?,
            levelId: row['level_id'] as int?,
            partId: row['part_id'] as int?,
            id: row['id'] as int?),
        arguments: [id],
        queryableName: 'exam',
        isView: false);
  }

  @override
  Future<void> deleteAllExam() async {
    await _queryAdapter.queryNoReturn('DELETE FROM exam');
  }

  @override
  Future<void> deleteExam(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE * FROM exam WHERE id= ?1', arguments: [id]);
  }

  @override
  Future<List<ExamEntity>> getListExamByTestId(int testId) async {
    return _queryAdapter.queryList(
        'SELECT exam.id, exam.paragraph, exam.audio, exam.level_id, exam.part_id     FROM exam, test_detail     WHERE exam.id = test_detail.exam_id AND test_detail.test_id = ?1',
        mapper: (Map<String, Object?> row) => ExamEntity(paragraph: row['paragraph'] as String?, audio: row['audio'] as String?, levelId: row['level_id'] as int?, partId: row['part_id'] as int?, id: row['id'] as int?),
        arguments: [testId]);
  }

  @override
  Future<void> insertExamEntity(ExamEntity examEntity) async {
    await _examEntityInsertionAdapter.insert(
        examEntity, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertExamEntities(List<ExamEntity> entities) async {
    await _examEntityInsertionAdapter.insertList(
        entities, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteExamEntity(ExamEntity examEntity) async {
    await _examEntityDeletionAdapter.delete(examEntity);
  }
}

class _$ExaminationDao extends ExaminationDao {
  _$ExaminationDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _examinationEntityInsertionAdapter = InsertionAdapter(
            database,
            'examination',
            (ExaminationEntity item) => <String, Object?>{
                  'id': item.id,
                  'test_id': item.testId,
                  'user_id': item.userId,
                  'number_correct_part_1': item.numberCorrectPart1,
                  'number_correct_part_2': item.numberCorrectPart2,
                  'number_correct_part_3': item.numberCorrectPart3,
                  'number_correct_part_4': item.numberCorrectPart4,
                  'number_correct_part_5': item.numberCorrectPart5,
                  'number_correct_part_6': item.numberCorrectPart6,
                  'number_correct_part_7': item.numberCorrectPart7,
                  'started_at': item.startedAt,
                  'finished_at': item.finishedAt,
                  'type_test_id': item.typeTestId
                },
            changeListener),
        _examinationEntityDeletionAdapter = DeletionAdapter(
            database,
            'examination',
            ['id'],
            (ExaminationEntity item) => <String, Object?>{
                  'id': item.id,
                  'test_id': item.testId,
                  'user_id': item.userId,
                  'number_correct_part_1': item.numberCorrectPart1,
                  'number_correct_part_2': item.numberCorrectPart2,
                  'number_correct_part_3': item.numberCorrectPart3,
                  'number_correct_part_4': item.numberCorrectPart4,
                  'number_correct_part_5': item.numberCorrectPart5,
                  'number_correct_part_6': item.numberCorrectPart6,
                  'number_correct_part_7': item.numberCorrectPart7,
                  'started_at': item.startedAt,
                  'finished_at': item.finishedAt,
                  'type_test_id': item.typeTestId
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ExaminationEntity> _examinationEntityInsertionAdapter;

  final DeletionAdapter<ExaminationEntity> _examinationEntityDeletionAdapter;

  @override
  Future<List<ExaminationEntity>> getAllExaminationEntity() async {
    return _queryAdapter.queryList('SELECT * FROM examination',
        mapper: (Map<String, Object?> row) => ExaminationEntity(
            id: row['id'] as int?,
            testId: row['test_id'] as int?,
            userId: row['user_id'] as int?,
            numberCorrectPart1: row['number_correct_part_1'] as int?,
            numberCorrectPart2: row['number_correct_part_2'] as int?,
            numberCorrectPart3: row['number_correct_part_3'] as int?,
            numberCorrectPart4: row['number_correct_part_4'] as int?,
            numberCorrectPart5: row['number_correct_part_5'] as int?,
            numberCorrectPart6: row['number_correct_part_6'] as int?,
            numberCorrectPart7: row['number_correct_part_7'] as int?,
            startedAt: row['started_at'] as String?,
            finishedAt: row['finished_at'] as String?,
            typeTestId: row['type_test_id'] as int?));
  }

  @override
  Stream<ExaminationEntity?> findExaminationById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM examination WHERE id = ?1',
        mapper: (Map<String, Object?> row) => ExaminationEntity(
            id: row['id'] as int?,
            testId: row['test_id'] as int?,
            userId: row['user_id'] as int?,
            numberCorrectPart1: row['number_correct_part_1'] as int?,
            numberCorrectPart2: row['number_correct_part_2'] as int?,
            numberCorrectPart3: row['number_correct_part_3'] as int?,
            numberCorrectPart4: row['number_correct_part_4'] as int?,
            numberCorrectPart5: row['number_correct_part_5'] as int?,
            numberCorrectPart6: row['number_correct_part_6'] as int?,
            numberCorrectPart7: row['number_correct_part_7'] as int?,
            startedAt: row['started_at'] as String?,
            finishedAt: row['finished_at'] as String?,
            typeTestId: row['type_test_id'] as int?),
        arguments: [id],
        queryableName: 'examination',
        isView: false);
  }

  @override
  Future<ExaminationEntity?> getExaminationByIdFromDB(int id) async {
    return _queryAdapter.query('SELECT * FROM examination WHERE id = ?1',
        mapper: (Map<String, Object?> row) => ExaminationEntity(
            id: row['id'] as int?,
            testId: row['test_id'] as int?,
            userId: row['user_id'] as int?,
            numberCorrectPart1: row['number_correct_part_1'] as int?,
            numberCorrectPart2: row['number_correct_part_2'] as int?,
            numberCorrectPart3: row['number_correct_part_3'] as int?,
            numberCorrectPart4: row['number_correct_part_4'] as int?,
            numberCorrectPart5: row['number_correct_part_5'] as int?,
            numberCorrectPart6: row['number_correct_part_6'] as int?,
            numberCorrectPart7: row['number_correct_part_7'] as int?,
            startedAt: row['started_at'] as String?,
            finishedAt: row['finished_at'] as String?,
            typeTestId: row['type_test_id'] as int?),
        arguments: [id]);
  }

  @override
  Future<void> deleteAllExamination() async {
    await _queryAdapter.queryNoReturn('DELETE FROM examination');
  }

  @override
  Future<void> deleteExamination(int id) async {
    await _queryAdapter.queryNoReturn('DELETE * FROM examination WHERE id= ?1',
        arguments: [id]);
  }

  @override
  Future<List<ExaminationEntity>> get3LastExaminationFromDB() async {
    return _queryAdapter.queryList(
        'SELECT * FROM examination        WHERE type_test_id = 8 AND       finished_at IS NOT NULL       ORDER BY id DESC       LIMIT 3',
        mapper: (Map<String, Object?> row) => ExaminationEntity(
            id: row['id'] as int?,
            testId: row['test_id'] as int?,
            userId: row['user_id'] as int?,
            numberCorrectPart1: row['number_correct_part_1'] as int?,
            numberCorrectPart2: row['number_correct_part_2'] as int?,
            numberCorrectPart3: row['number_correct_part_3'] as int?,
            numberCorrectPart4: row['number_correct_part_4'] as int?,
            numberCorrectPart5: row['number_correct_part_5'] as int?,
            numberCorrectPart6: row['number_correct_part_6'] as int?,
            numberCorrectPart7: row['number_correct_part_7'] as int?,
            startedAt: row['started_at'] as String?,
            finishedAt: row['finished_at'] as String?,
            typeTestId: row['type_test_id'] as int?));
  }

  @override
  Future<ExaminationEntity?> getTheLastExaminationByTestId(int testId) async {
    return _queryAdapter.query(
        'select *        FROM examination       WHERE test_id = ?1 AND examination.finished_at IS NOT NULL       ORDER BY examination.id DESC       LIMIT 1',
        mapper: (Map<String, Object?> row) => ExaminationEntity(id: row['id'] as int?, testId: row['test_id'] as int?, userId: row['user_id'] as int?, numberCorrectPart1: row['number_correct_part_1'] as int?, numberCorrectPart2: row['number_correct_part_2'] as int?, numberCorrectPart3: row['number_correct_part_3'] as int?, numberCorrectPart4: row['number_correct_part_4'] as int?, numberCorrectPart5: row['number_correct_part_5'] as int?, numberCorrectPart6: row['number_correct_part_6'] as int?, numberCorrectPart7: row['number_correct_part_7'] as int?, startedAt: row['started_at'] as String?, finishedAt: row['finished_at'] as String?, typeTestId: row['type_test_id'] as int?),
        arguments: [testId]);
  }

  @override
  Future<ExaminationEntity?> getExaminationHaveNotFinished(
    int userId,
    int testId,
  ) async {
    return _queryAdapter.query(
        'SELECT * FROM examination     WHERE examination.user_id = ?1 AND examination.finished_at IS NOT NULL AND examination.test_id = ?2     ORDER BY examination.id DESC     LIMIT 1',
        mapper: (Map<String, Object?> row) => ExaminationEntity(id: row['id'] as int?, testId: row['test_id'] as int?, userId: row['user_id'] as int?, numberCorrectPart1: row['number_correct_part_1'] as int?, numberCorrectPart2: row['number_correct_part_2'] as int?, numberCorrectPart3: row['number_correct_part_3'] as int?, numberCorrectPart4: row['number_correct_part_4'] as int?, numberCorrectPart5: row['number_correct_part_5'] as int?, numberCorrectPart6: row['number_correct_part_6'] as int?, numberCorrectPart7: row['number_correct_part_7'] as int?, startedAt: row['started_at'] as String?, finishedAt: row['finished_at'] as String?, typeTestId: row['type_test_id'] as int?),
        arguments: [userId, testId]);
  }

  @override
  Future<void> insertExaminationEntity(
      ExaminationEntity examinationEntity) async {
    await _examinationEntityInsertionAdapter.insert(
        examinationEntity, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertListExaminationEntity(List<ExaminationEntity> data) async {
    await _examinationEntityInsertionAdapter.insertList(
        data, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteExaminationEntity(
      ExaminationEntity examinationEntity) async {
    await _examinationEntityDeletionAdapter.delete(examinationEntity);
  }
}

class _$ExaminationDetailDao extends ExaminationDetailDao {
  _$ExaminationDetailDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _examinationDetailEntityInsertionAdapter = InsertionAdapter(
            database,
            'examination_detail',
            (ExaminationDetailEntity item) => <String, Object?>{
                  'id': item.id,
                  'examination_id': item.examinationId,
                  'question_id': item.questionId,
                  'selection': item.selection
                },
            changeListener),
        _examinationDetailEntityDeletionAdapter = DeletionAdapter(
            database,
            'examination_detail',
            ['id'],
            (ExaminationDetailEntity item) => <String, Object?>{
                  'id': item.id,
                  'examination_id': item.examinationId,
                  'question_id': item.questionId,
                  'selection': item.selection
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ExaminationDetailEntity>
      _examinationDetailEntityInsertionAdapter;

  final DeletionAdapter<ExaminationDetailEntity>
      _examinationDetailEntityDeletionAdapter;

  @override
  Future<List<ExaminationDetailEntity>> getAllExaminationDetailEntity() async {
    return _queryAdapter.queryList('SELECT * FROM examination_detail',
        mapper: (Map<String, Object?> row) => ExaminationDetailEntity(
            id: row['id'] as int?,
            examinationId: row['examination_id'] as int?,
            questionId: row['question_id'] as int?,
            selection: row['selection'] as String?));
  }

  @override
  Stream<ExaminationDetailEntity?> findExaminationDetailById(int id) {
    return _queryAdapter.queryStream(
        'SELECT * FROM examination_detail WHERE id = ?1',
        mapper: (Map<String, Object?> row) => ExaminationDetailEntity(
            id: row['id'] as int?,
            examinationId: row['examination_id'] as int?,
            questionId: row['question_id'] as int?,
            selection: row['selection'] as String?),
        arguments: [id],
        queryableName: 'examination_detail',
        isView: false);
  }

  @override
  Future<void> deleteAllExaminationDetail() async {
    await _queryAdapter.queryNoReturn('DELETE FROM examination_detail');
  }

  @override
  Future<void> deleteExaminationDetail(int id) async {
    await _queryAdapter.queryNoReturn(
        'DELETE * FROM examination_detail WHERE id= ?1',
        arguments: [id]);
  }

  @override
  Future<List<ExaminationDetailEntity>> getExaminationDetailByExaminationId(
      int id) async {
    return _queryAdapter.queryList(
        'select *        FROM examination_detail       WHERE examination_detail.examination_id = ?1       ORDER BY examination_detail.id ASC',
        mapper: (Map<String, Object?> row) => ExaminationDetailEntity(id: row['id'] as int?, examinationId: row['examination_id'] as int?, questionId: row['question_id'] as int?, selection: row['selection'] as String?),
        arguments: [id]);
  }

  @override
  Future<void> insertExaminationDetailEntity(
      ExaminationDetailEntity examinationDetailEntity) async {
    await _examinationDetailEntityInsertionAdapter.insert(
        examinationDetailEntity, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertExaminationDetails(
      List<ExaminationDetailEntity> entities) async {
    await _examinationDetailEntityInsertionAdapter.insertList(
        entities, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteExaminationDetailEntity(
      ExaminationDetailEntity examinationDetailEntity) async {
    await _examinationDetailEntityDeletionAdapter
        .delete(examinationDetailEntity);
  }
}

class _$ImageDao extends ImageDao {
  _$ImageDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _imageEntityInsertionAdapter = InsertionAdapter(
            database,
            'image',
            (ImageEntity item) => <String, Object?>{
                  'id': item.id,
                  'exam_id': item.examId,
                  'index': item.index,
                  'url': item.url
                },
            changeListener),
        _imageEntityDeletionAdapter = DeletionAdapter(
            database,
            'image',
            ['id'],
            (ImageEntity item) => <String, Object?>{
                  'id': item.id,
                  'exam_id': item.examId,
                  'index': item.index,
                  'url': item.url
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ImageEntity> _imageEntityInsertionAdapter;

  final DeletionAdapter<ImageEntity> _imageEntityDeletionAdapter;

  @override
  Future<List<ImageEntity>> getAllImageEntity() async {
    return _queryAdapter.queryList('SELECT * FROM image',
        mapper: (Map<String, Object?> row) => ImageEntity(
            id: row['id'] as int?,
            examId: row['exam_id'] as int?,
            index: row['index'] as int?,
            url: row['url'] as String?));
  }

  @override
  Stream<ImageEntity?> findImageById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM image WHERE id = ?1',
        mapper: (Map<String, Object?> row) => ImageEntity(
            id: row['id'] as int?,
            examId: row['exam_id'] as int?,
            index: row['index'] as int?,
            url: row['url'] as String?),
        arguments: [id],
        queryableName: 'image',
        isView: false);
  }

  @override
  Future<void> deleteAllImage() async {
    await _queryAdapter.queryNoReturn('DELETE FROM image');
  }

  @override
  Future<void> deleteImage(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE * FROM image WHERE id= ?1', arguments: [id]);
  }

  @override
  Future<List<ImageEntity>> getListImageByExamId(int examId) async {
    return _queryAdapter.queryList(
        'SELECT *     FROM image     WHERE image.exam_id = ?1',
        mapper: (Map<String, Object?> row) => ImageEntity(
            id: row['id'] as int?,
            examId: row['exam_id'] as int?,
            index: row['index'] as int?,
            url: row['url'] as String?),
        arguments: [examId]);
  }

  @override
  Future<void> insertImageEntity(ImageEntity imageEntity) async {
    await _imageEntityInsertionAdapter.insert(
        imageEntity, OnConflictStrategy.replace);
  }

  @override
  Future<void> insertImageEntities(List<ImageEntity> entities) async {
    await _imageEntityInsertionAdapter.insertList(
        entities, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteImageEntity(ImageEntity imageEntity) async {
    await _imageEntityDeletionAdapter.delete(imageEntity);
  }
}

class _$LevelDao extends LevelDao {
  _$LevelDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _levelEntityInsertionAdapter = InsertionAdapter(
            database,
            'level',
            (LevelEntity item) =>
                <String, Object?>{'id': item.id, 'name': item.name},
            changeListener),
        _levelEntityDeletionAdapter = DeletionAdapter(
            database,
            'level',
            ['id'],
            (LevelEntity item) =>
                <String, Object?>{'id': item.id, 'name': item.name},
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<LevelEntity> _levelEntityInsertionAdapter;

  final DeletionAdapter<LevelEntity> _levelEntityDeletionAdapter;

  @override
  Future<List<LevelEntity>> getAllLevelEntity() async {
    return _queryAdapter.queryList('SELECT * FROM level',
        mapper: (Map<String, Object?> row) =>
            LevelEntity(id: row['id'] as int?, name: row['name'] as String?));
  }

  @override
  Stream<LevelEntity?> findLevelById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM level WHERE id = ?1',
        mapper: (Map<String, Object?> row) =>
            LevelEntity(id: row['id'] as int?, name: row['name'] as String?),
        arguments: [id],
        queryableName: 'level',
        isView: false);
  }

  @override
  Future<void> deleteAllLevel() async {
    await _queryAdapter.queryNoReturn('DELETE FROM level');
  }

  @override
  Future<void> deleteLevel(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE * FROM level WHERE id= ?1', arguments: [id]);
  }

  @override
  Future<LevelEntity?> getLevelById(int id) async {
    return _queryAdapter.query('SELECT * FROM level WHERE id = ?1',
        mapper: (Map<String, Object?> row) =>
            LevelEntity(id: row['id'] as int?, name: row['name'] as String?),
        arguments: [id]);
  }

  @override
  Future<void> insertLevelEntity(LevelEntity levelEntity) async {
    await _levelEntityInsertionAdapter.insert(
        levelEntity, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertLevelsEntity(List<LevelEntity> levelsEntity) async {
    await _levelEntityInsertionAdapter.insertList(
        levelsEntity, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteLevelEntity(LevelEntity levelEntity) async {
    await _levelEntityDeletionAdapter.delete(levelEntity);
  }
}

class _$PartDao extends PartDao {
  _$PartDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _partEntityInsertionAdapter = InsertionAdapter(
            database,
            'part',
            (PartEntity item) =>
                <String, Object?>{'id': item.id, 'name': item.name},
            changeListener),
        _partEntityDeletionAdapter = DeletionAdapter(
            database,
            'part',
            ['id'],
            (PartEntity item) =>
                <String, Object?>{'id': item.id, 'name': item.name},
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PartEntity> _partEntityInsertionAdapter;

  final DeletionAdapter<PartEntity> _partEntityDeletionAdapter;

  @override
  Future<List<PartEntity>> getAllPartEntity() async {
    return _queryAdapter.queryList('SELECT * FROM part',
        mapper: (Map<String, Object?> row) =>
            PartEntity(id: row['id'] as int?, name: row['name'] as String?));
  }

  @override
  Stream<PartEntity?> findPartById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM part WHERE id = ?1',
        mapper: (Map<String, Object?> row) =>
            PartEntity(id: row['id'] as int?, name: row['name'] as String?),
        arguments: [id],
        queryableName: 'part',
        isView: false);
  }

  @override
  Future<void> deleteAllPart() async {
    await _queryAdapter.queryNoReturn('DELETE FROM part');
  }

  @override
  Future<void> deletePart(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE * FROM part WHERE id= ?1', arguments: [id]);
  }

  @override
  Future<PartEntity?> getPartById(int id) async {
    return _queryAdapter.query('SELECT * FROM part WHERE id = ?1',
        mapper: (Map<String, Object?> row) =>
            PartEntity(id: row['id'] as int?, name: row['name'] as String?),
        arguments: [id]);
  }

  @override
  Future<void> insertPartEntity(PartEntity partEntity) async {
    await _partEntityInsertionAdapter.insert(
        partEntity, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertPartsEntity(List<PartEntity> partsEntity) async {
    await _partEntityInsertionAdapter.insertList(
        partsEntity, OnConflictStrategy.replace);
  }

  @override
  Future<void> deletePartEntity(PartEntity partEntity) async {
    await _partEntityDeletionAdapter.delete(partEntity);
  }
}

class _$QuestionDao extends QuestionDao {
  _$QuestionDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _questionEntityInsertionAdapter = InsertionAdapter(
            database,
            'question',
            (QuestionEntity item) => <String, Object?>{
                  'id': item.id,
                  'content': item.content,
                  'explain': item.explain,
                  'a': item.a,
                  'b': item.b,
                  'c': item.c,
                  'd': item.d,
                  'answer': item.answer,
                  'exam_id': item.examId
                },
            changeListener),
        _questionEntityDeletionAdapter = DeletionAdapter(
            database,
            'question',
            ['id'],
            (QuestionEntity item) => <String, Object?>{
                  'id': item.id,
                  'content': item.content,
                  'explain': item.explain,
                  'a': item.a,
                  'b': item.b,
                  'c': item.c,
                  'd': item.d,
                  'answer': item.answer,
                  'exam_id': item.examId
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<QuestionEntity> _questionEntityInsertionAdapter;

  final DeletionAdapter<QuestionEntity> _questionEntityDeletionAdapter;

  @override
  Future<List<QuestionEntity>> getAllQuestionEntity() async {
    return _queryAdapter.queryList('SELECT * FROM question',
        mapper: (Map<String, Object?> row) => QuestionEntity(
            id: row['id'] as int?,
            content: row['content'] as String?,
            explain: row['explain'] as String?,
            a: row['a'] as String?,
            b: row['b'] as String?,
            c: row['c'] as String?,
            d: row['d'] as String?,
            answer: row['answer'] as String?,
            examId: row['exam_id'] as int?));
  }

  @override
  Stream<QuestionEntity?> findQuestionById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM question WHERE id = ?1',
        mapper: (Map<String, Object?> row) => QuestionEntity(
            id: row['id'] as int?,
            content: row['content'] as String?,
            explain: row['explain'] as String?,
            a: row['a'] as String?,
            b: row['b'] as String?,
            c: row['c'] as String?,
            d: row['d'] as String?,
            answer: row['answer'] as String?,
            examId: row['exam_id'] as int?),
        arguments: [id],
        queryableName: 'question',
        isView: false);
  }

  @override
  Future<void> deleteAllQuestion() async {
    await _queryAdapter.queryNoReturn('DELETE FROM question');
  }

  @override
  Future<void> deleteQuestion(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE * FROM question WHERE id= ?1', arguments: [id]);
  }

  @override
  Future<List<QuestionEntity>> getListQuestionByExamId(int examId) async {
    return _queryAdapter.queryList(
        'SELECT *     FROM question     WHERE question.exam_id = ?1     ORDER BY id ASC',
        mapper: (Map<String, Object?> row) => QuestionEntity(id: row['id'] as int?, content: row['content'] as String?, explain: row['explain'] as String?, a: row['a'] as String?, b: row['b'] as String?, c: row['c'] as String?, d: row['d'] as String?, answer: row['answer'] as String?, examId: row['exam_id'] as int?),
        arguments: [examId]);
  }

  @override
  Future<QuestionEntity?> getQuestionById(int id) async {
    return _queryAdapter.query('SELECT * FROM question WHERE id = ?1',
        mapper: (Map<String, Object?> row) => QuestionEntity(
            id: row['id'] as int?,
            content: row['content'] as String?,
            explain: row['explain'] as String?,
            a: row['a'] as String?,
            b: row['b'] as String?,
            c: row['c'] as String?,
            d: row['d'] as String?,
            answer: row['answer'] as String?,
            examId: row['exam_id'] as int?),
        arguments: [id]);
  }

  @override
  Future<void> insertQuestionEntity(QuestionEntity questionEntity) async {
    await _questionEntityInsertionAdapter.insert(
        questionEntity, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertQuestionEntities(List<QuestionEntity> entities) async {
    await _questionEntityInsertionAdapter.insertList(
        entities, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteQuestionEntity(QuestionEntity questionEntity) async {
    await _questionEntityDeletionAdapter.delete(questionEntity);
  }
}

class _$RoutineDao extends RoutineDao {
  _$RoutineDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _routineEntityInsertionAdapter = InsertionAdapter(
            database,
            'routine',
            (RoutineEntity item) => <String, Object?>{
                  'id': item.id,
                  'user_id': item.userId,
                  'created_at': item.createdAt,
                  'total_time': item.totalTime,
                  'number_of_practice': item.numberOfPractice,
                  'number_of_test': item.numberOfTest
                },
            changeListener),
        _routineEntityDeletionAdapter = DeletionAdapter(
            database,
            'routine',
            ['id'],
            (RoutineEntity item) => <String, Object?>{
                  'id': item.id,
                  'user_id': item.userId,
                  'created_at': item.createdAt,
                  'total_time': item.totalTime,
                  'number_of_practice': item.numberOfPractice,
                  'number_of_test': item.numberOfTest
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<RoutineEntity> _routineEntityInsertionAdapter;

  final DeletionAdapter<RoutineEntity> _routineEntityDeletionAdapter;

  @override
  Future<List<RoutineEntity>> getAllRoutineEntity() async {
    return _queryAdapter.queryList('SELECT * FROM routine',
        mapper: (Map<String, Object?> row) => RoutineEntity(
            id: row['id'] as int?,
            userId: row['user_id'] as int?,
            createdAt: row['created_at'] as String?,
            totalTime: row['total_time'] as int?,
            numberOfPractice: row['number_of_practice'] as int?,
            numberOfTest: row['number_of_test'] as int?));
  }

  @override
  Stream<RoutineEntity?> findRoutineById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM routine WHERE id = ?1',
        mapper: (Map<String, Object?> row) => RoutineEntity(
            id: row['id'] as int?,
            userId: row['user_id'] as int?,
            createdAt: row['created_at'] as String?,
            totalTime: row['total_time'] as int?,
            numberOfPractice: row['number_of_practice'] as int?,
            numberOfTest: row['number_of_test'] as int?),
        arguments: [id],
        queryableName: 'routine',
        isView: false);
  }

  @override
  Future<void> deleteAllRoutine() async {
    await _queryAdapter.queryNoReturn('DELETE FROM routine');
  }

  @override
  Future<void> deleteRoutine(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE * FROM routine WHERE id= ?1', arguments: [id]);
  }

  @override
  Future<List<RoutineEntity>> getActivity(
    String year,
    String month,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM routine     WHERE strftime(\'%m\',created_at) = ?2 AND strftime(\'%Y\',created_at) = ?1',
        mapper: (Map<String, Object?> row) => RoutineEntity(id: row['id'] as int?, userId: row['user_id'] as int?, createdAt: row['created_at'] as String?, totalTime: row['total_time'] as int?, numberOfPractice: row['number_of_practice'] as int?, numberOfTest: row['number_of_test'] as int?),
        arguments: [year, month]);
  }

  @override
  Future<RoutineEntity?> getExaminationByDate(
    String year,
    String month,
    String date,
  ) async {
    return _queryAdapter.query(
        'SELECT * FROM routine     WHERE strftime(\'%m\',created_at) = ?2 AND strftime(\'%Y\',created_at) = ?1 AND strftime(\'%d\',created_at) = ?3     LIMIT 1',
        mapper: (Map<String, Object?> row) => RoutineEntity(id: row['id'] as int?, userId: row['user_id'] as int?, createdAt: row['created_at'] as String?, totalTime: row['total_time'] as int?, numberOfPractice: row['number_of_practice'] as int?, numberOfTest: row['number_of_test'] as int?),
        arguments: [year, month, date]);
  }

  @override
  Future<void> insertRoutineEntity(RoutineEntity routineEntity) async {
    await _routineEntityInsertionAdapter.insert(
        routineEntity, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertRoutineEntities(List<RoutineEntity> entities) async {
    await _routineEntityInsertionAdapter.insertList(
        entities, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteRoutineEntity(RoutineEntity routineEntity) async {
    await _routineEntityDeletionAdapter.delete(routineEntity);
  }
}

class _$TestDao extends TestDao {
  _$TestDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _testEntityInsertionAdapter = InsertionAdapter(
            database,
            'test',
            (TestEntity item) => <String, Object?>{
                  'id': item.id,
                  'user_id': item.userId,
                  'type_test_id': item.typeTestId,
                  'target': item.target,
                  'is_available': item.isAvailable == null
                      ? null
                      : (item.isAvailable! ? 1 : 0),
                  'created_at': item.createdAt,
                  'downloaded': item.downloaded == null
                      ? null
                      : (item.downloaded! ? 1 : 0)
                },
            changeListener),
        _testEntityDeletionAdapter = DeletionAdapter(
            database,
            'test',
            ['id'],
            (TestEntity item) => <String, Object?>{
                  'id': item.id,
                  'user_id': item.userId,
                  'type_test_id': item.typeTestId,
                  'target': item.target,
                  'is_available': item.isAvailable == null
                      ? null
                      : (item.isAvailable! ? 1 : 0),
                  'created_at': item.createdAt,
                  'downloaded': item.downloaded == null
                      ? null
                      : (item.downloaded! ? 1 : 0)
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TestEntity> _testEntityInsertionAdapter;

  final DeletionAdapter<TestEntity> _testEntityDeletionAdapter;

  @override
  Future<List<TestEntity>> getAllTestEntity() async {
    return _queryAdapter.queryList('SELECT * FROM test',
        mapper: (Map<String, Object?> row) => TestEntity(
            id: row['id'] as int?,
            userId: row['user_id'] as int?,
            typeTestId: row['type_test_id'] as int?,
            target: row['target'] as int?,
            isAvailable: row['is_available'] == null
                ? null
                : (row['is_available'] as int) != 0,
            createdAt: row['created_at'] as String?,
            downloaded: row['downloaded'] == null
                ? null
                : (row['downloaded'] as int) != 0));
  }

  @override
  Stream<TestEntity?> findTestById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM test WHERE id = ?1',
        mapper: (Map<String, Object?> row) => TestEntity(
            id: row['id'] as int?,
            userId: row['user_id'] as int?,
            typeTestId: row['type_test_id'] as int?,
            target: row['target'] as int?,
            isAvailable: row['is_available'] == null
                ? null
                : (row['is_available'] as int) != 0,
            createdAt: row['created_at'] as String?,
            downloaded: row['downloaded'] == null
                ? null
                : (row['downloaded'] as int) != 0),
        arguments: [id],
        queryableName: 'test',
        isView: false);
  }

  @override
  Future<TestEntity?> getTestById(int id) async {
    return _queryAdapter.query('SELECT * FROM test WHERE id = ?1',
        mapper: (Map<String, Object?> row) => TestEntity(
            id: row['id'] as int?,
            userId: row['user_id'] as int?,
            typeTestId: row['type_test_id'] as int?,
            target: row['target'] as int?,
            isAvailable: row['is_available'] == null
                ? null
                : (row['is_available'] as int) != 0,
            createdAt: row['created_at'] as String?,
            downloaded: row['downloaded'] == null
                ? null
                : (row['downloaded'] as int) != 0),
        arguments: [id]);
  }

  @override
  Future<List<int>?> getIdsFromTestDownloaded() async {
    await _queryAdapter
        .queryNoReturn('SELECT id FROM test WHERE downloaded = true');
  }

  @override
  Future<void> deleteAllTest() async {
    await _queryAdapter.queryNoReturn('DELETE FROM test');
  }

  @override
  Future<void> deleteTest(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE * FROM test WHERE id= ?1', arguments: [id]);
  }

  @override
  Future<void> updateDownload(int id) async {
    await _queryAdapter.queryNoReturn(
        'UPDATE test       SET downloaded = true       WHERE id = ?1',
        arguments: [id]);
  }

  @override
  Future<List<TestEntity>> getListTestByTypeAndTarget(
    int typeId,
    int target,
  ) async {
    return _queryAdapter.queryList(
        'SELECT * FROM test     WHERE type_test_id = ?1 AND target = ?2 AND downloaded = true',
        mapper: (Map<String, Object?> row) => TestEntity(id: row['id'] as int?, userId: row['user_id'] as int?, typeTestId: row['type_test_id'] as int?, target: row['target'] as int?, isAvailable: row['is_available'] == null ? null : (row['is_available'] as int) != 0, createdAt: row['created_at'] as String?, downloaded: row['downloaded'] == null ? null : (row['downloaded'] as int) != 0),
        arguments: [typeId, target]);
  }

  @override
  Future<int?> getTypeTestIdByTestId(int id) async {
    await _queryAdapter.queryNoReturn(
        'SELECT type_test_id FROM test     WHERE id = ?1',
        arguments: [id]);
  }

  @override
  Future<void> insertTestEntity(TestEntity testEntity) async {
    await _testEntityInsertionAdapter.insert(
        testEntity, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertTestEntities(List<TestEntity> entities) async {
    await _testEntityInsertionAdapter.insertList(
        entities, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteTestEntity(TestEntity testEntity) async {
    await _testEntityDeletionAdapter.delete(testEntity);
  }
}

class _$TestDetailDao extends TestDetailDao {
  _$TestDetailDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _testDetailEntityInsertionAdapter = InsertionAdapter(
            database,
            'test_detail',
            (TestDetailEntity item) => <String, Object?>{
                  'id': item.id,
                  'test_id': item.testId,
                  'exam_id': item.examId
                },
            changeListener),
        _testDetailEntityDeletionAdapter = DeletionAdapter(
            database,
            'test_detail',
            ['id'],
            (TestDetailEntity item) => <String, Object?>{
                  'id': item.id,
                  'test_id': item.testId,
                  'exam_id': item.examId
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TestDetailEntity> _testDetailEntityInsertionAdapter;

  final DeletionAdapter<TestDetailEntity> _testDetailEntityDeletionAdapter;

  @override
  Future<List<TestDetailEntity>> getAllTestDetailEntity() async {
    return _queryAdapter.queryList('SELECT * FROM test_detail',
        mapper: (Map<String, Object?> row) => TestDetailEntity(
            id: row['id'] as int?,
            testId: row['test_id'] as int?,
            examId: row['exam_id'] as int?));
  }

  @override
  Stream<TestDetailEntity?> findTestDetailById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM test_detail WHERE id = ?1',
        mapper: (Map<String, Object?> row) => TestDetailEntity(
            id: row['id'] as int?,
            testId: row['test_id'] as int?,
            examId: row['exam_id'] as int?),
        arguments: [id],
        queryableName: 'test_detail',
        isView: false);
  }

  @override
  Future<void> deleteAllTestDetail() async {
    await _queryAdapter.queryNoReturn('DELETE FROM test_detail');
  }

  @override
  Future<void> deleteTestDetail(int id) async {
    await _queryAdapter.queryNoReturn('DELETE * FROM test_detail WHERE id= ?1',
        arguments: [id]);
  }

  @override
  Future<void> insertTestDetailEntity(TestDetailEntity typeTestEntity) async {
    await _testDetailEntityInsertionAdapter.insert(
        typeTestEntity, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertTestDetailEntities(List<TestDetailEntity> entities) async {
    await _testDetailEntityInsertionAdapter.insertList(
        entities, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteTestDetailEntity(TestDetailEntity typeTestEntity) async {
    await _testDetailEntityDeletionAdapter.delete(typeTestEntity);
  }
}

class _$TypeTestDao extends TypeTestDao {
  _$TypeTestDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _typeTestEntityInsertionAdapter = InsertionAdapter(
            database,
            'type_test',
            (TypeTestEntity item) =>
                <String, Object?>{'id': item.id, 'name': item.name}),
        _typeTestEntityDeletionAdapter = DeletionAdapter(
            database,
            'type_test',
            ['id'],
            (TypeTestEntity item) =>
                <String, Object?>{'id': item.id, 'name': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TypeTestEntity> _typeTestEntityInsertionAdapter;

  final DeletionAdapter<TypeTestEntity> _typeTestEntityDeletionAdapter;

  @override
  Future<List<TypeTestEntity>> getAllTypeTestEntity() async {
    return _queryAdapter.queryList('SELECT * FROM type_test',
        mapper: (Map<String, Object?> row) => TypeTestEntity(
            id: row['id'] as int?, name: row['name'] as String?));
  }

  @override
  Future<TypeTestEntity?> findTypeTestById(int id) async {
    return _queryAdapter.query('SELECT * FROM type_test WHERE id = ?1',
        mapper: (Map<String, Object?> row) =>
            TypeTestEntity(id: row['id'] as int?, name: row['name'] as String?),
        arguments: [id]);
  }

  @override
  Future<void> deleteAllTypeTest() async {
    await _queryAdapter.queryNoReturn('DELETE FROM type_test');
  }

  @override
  Future<void> deleteTypeTest(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE * FROM type_test WHERE id= ?1', arguments: [id]);
  }

  @override
  Future<void> insertTypeTestEntity(TypeTestEntity typeTestEntity) async {
    await _typeTestEntityInsertionAdapter.insert(
        typeTestEntity, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertTypesTestEntity(
      List<TypeTestEntity> typesTestEntity) async {
    await _typeTestEntityInsertionAdapter.insertList(
        typesTestEntity, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteTypeTestEntity(TypeTestEntity typeTestEntity) async {
    await _typeTestEntityDeletionAdapter.delete(typeTestEntity);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _userEntityInsertionAdapter = InsertionAdapter(
            database,
            'user',
            (UserEntity item) => <String, Object?>{
                  'id': item.id,
                  'first_name': item.firstName,
                  'last_name': item.lastName,
                  'email': item.email,
                  'password': item.password,
                  'birth_date': item.birthDate,
                  'address': item.address,
                  'phone_number': item.phoneNumber,
                  'gender': item.gender,
                  'avatar': item.avatar,
                  'is_active':
                      item.isActive == null ? null : (item.isActive! ? 1 : 0),
                  'rule_id': item.ruleId,
                  'target': item.target,
                  'firebase_token': item.firebaseToken,
                  'created_at': item.createdAt,
                  'updated_at': item.updatedAt
                },
            changeListener),
        _userEntityDeletionAdapter = DeletionAdapter(
            database,
            'user',
            ['id'],
            (UserEntity item) => <String, Object?>{
                  'id': item.id,
                  'first_name': item.firstName,
                  'last_name': item.lastName,
                  'email': item.email,
                  'password': item.password,
                  'birth_date': item.birthDate,
                  'address': item.address,
                  'phone_number': item.phoneNumber,
                  'gender': item.gender,
                  'avatar': item.avatar,
                  'is_active':
                      item.isActive == null ? null : (item.isActive! ? 1 : 0),
                  'rule_id': item.ruleId,
                  'target': item.target,
                  'firebase_token': item.firebaseToken,
                  'created_at': item.createdAt,
                  'updated_at': item.updatedAt
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UserEntity> _userEntityInsertionAdapter;

  final DeletionAdapter<UserEntity> _userEntityDeletionAdapter;

  @override
  Future<List<UserEntity>> getAllUserEntity() async {
    return _queryAdapter.queryList('SELECT * FROM user',
        mapper: (Map<String, Object?> row) => UserEntity(
            id: row['id'] as int?,
            firstName: row['first_name'] as String?,
            lastName: row['last_name'] as String?,
            email: row['email'] as String?,
            password: row['password'] as String?,
            birthDate: row['birth_date'] as String?,
            address: row['address'] as String?,
            phoneNumber: row['phone_number'] as String?,
            gender: row['gender'] as String?,
            avatar: row['avatar'] as String?,
            isActive: row['is_active'] == null
                ? null
                : (row['is_active'] as int) != 0,
            ruleId: row['rule_id'] as int?,
            target: row['target'] as int?,
            firebaseToken: row['firebase_token'] as String?,
            createdAt: row['created_at'] as String?,
            updatedAt: row['updated_at'] as String?));
  }

  @override
  Stream<UserEntity?> findUserById(int id) {
    return _queryAdapter.queryStream('SELECT * FROM user WHERE id = ?1',
        mapper: (Map<String, Object?> row) => UserEntity(
            id: row['id'] as int?,
            firstName: row['first_name'] as String?,
            lastName: row['last_name'] as String?,
            email: row['email'] as String?,
            password: row['password'] as String?,
            birthDate: row['birth_date'] as String?,
            address: row['address'] as String?,
            phoneNumber: row['phone_number'] as String?,
            gender: row['gender'] as String?,
            avatar: row['avatar'] as String?,
            isActive: row['is_active'] == null
                ? null
                : (row['is_active'] as int) != 0,
            ruleId: row['rule_id'] as int?,
            target: row['target'] as int?,
            firebaseToken: row['firebase_token'] as String?,
            createdAt: row['created_at'] as String?,
            updatedAt: row['updated_at'] as String?),
        arguments: [id],
        queryableName: 'user',
        isView: false);
  }

  @override
  Future<UserEntity?> getUserFromDB() async {
    return _queryAdapter.query('SELECT * FROM user LIMIT 1',
        mapper: (Map<String, Object?> row) => UserEntity(
            id: row['id'] as int?,
            firstName: row['first_name'] as String?,
            lastName: row['last_name'] as String?,
            email: row['email'] as String?,
            password: row['password'] as String?,
            birthDate: row['birth_date'] as String?,
            address: row['address'] as String?,
            phoneNumber: row['phone_number'] as String?,
            gender: row['gender'] as String?,
            avatar: row['avatar'] as String?,
            isActive: row['is_active'] == null
                ? null
                : (row['is_active'] as int) != 0,
            ruleId: row['rule_id'] as int?,
            target: row['target'] as int?,
            firebaseToken: row['firebase_token'] as String?,
            createdAt: row['created_at'] as String?,
            updatedAt: row['updated_at'] as String?));
  }

  @override
  Future<void> deleteAllUser() async {
    await _queryAdapter.queryNoReturn('DELETE FROM user');
  }

  @override
  Future<void> deleteUser(int id) async {
    await _queryAdapter
        .queryNoReturn('DELETE * FROM user WHERE id= ?1', arguments: [id]);
  }

  @override
  Future<List<NumberOfTestEntity>> getNumberTestOfUserTested() async {
    return _queryAdapter.queryList(
        'SELECT COUNT(DISTINCT(examination.test_id)) AS total, type_test_id     FROM examination     WHERE examination.finished_at IS NOT NULL     GROUP BY(type_test_id)',
        mapper: (Map<String, Object?> row) => NumberOfTestEntity(
            typeTestId: row['type_test_id'] as int?,
            total: row['total'] as int?));
  }

  @override
  Future<List<NumberOfTestEntity>> getNumberOfTestCreated() async {
    return _queryAdapter.queryList(
        'SELECT type_test_id, COUNT(id) AS total     FROM test     GROUP BY (type_test_id)     ORDER BY type_test_id ASC',
        mapper: (Map<String, Object?> row) => NumberOfTestEntity(
            typeTestId: row['type_test_id'] as int?,
            total: row['total'] as int?));
  }

  @override
  Future<List<ExaminationEntity>> get3TheLastExamination() async {
    return _queryAdapter.queryList(
        'SELECT *     FROM examination     WHERE type_test_id = 8     ORDER BY id DESC     LIMIT 3',
        mapper: (Map<String, Object?> row) => ExaminationEntity(
            id: row['id'] as int?,
            testId: row['test_id'] as int?,
            userId: row['user_id'] as int?,
            numberCorrectPart1: row['number_correct_part_1'] as int?,
            numberCorrectPart2: row['number_correct_part_2'] as int?,
            numberCorrectPart3: row['number_correct_part_3'] as int?,
            numberCorrectPart4: row['number_correct_part_4'] as int?,
            numberCorrectPart5: row['number_correct_part_5'] as int?,
            numberCorrectPart6: row['number_correct_part_6'] as int?,
            numberCorrectPart7: row['number_correct_part_7'] as int?,
            startedAt: row['started_at'] as String?,
            finishedAt: row['finished_at'] as String?,
            typeTestId: row['type_test_id'] as int?));
  }

  @override
  Future<UserEntity?> getUserById(int id) async {
    return _queryAdapter.query('SELECT * FROM user WHERE id = ?1',
        mapper: (Map<String, Object?> row) => UserEntity(
            id: row['id'] as int?,
            firstName: row['first_name'] as String?,
            lastName: row['last_name'] as String?,
            email: row['email'] as String?,
            password: row['password'] as String?,
            birthDate: row['birth_date'] as String?,
            address: row['address'] as String?,
            phoneNumber: row['phone_number'] as String?,
            gender: row['gender'] as String?,
            avatar: row['avatar'] as String?,
            isActive: row['is_active'] == null
                ? null
                : (row['is_active'] as int) != 0,
            ruleId: row['rule_id'] as int?,
            target: row['target'] as int?,
            firebaseToken: row['firebase_token'] as String?,
            createdAt: row['created_at'] as String?,
            updatedAt: row['updated_at'] as String?),
        arguments: [id]);
  }

  @override
  Future<void> insertUserEntity(UserEntity userEntity) async {
    await _userEntityInsertionAdapter.insert(
        userEntity, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteUserEntity(UserEntity userEntity) async {
    await _userEntityDeletionAdapter.delete(userEntity);
  }
}
