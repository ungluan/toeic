import 'package:dio/dio.dart';
import 'package:toeic/database/entities/exam_entity.dart';
import 'package:toeic/database/entities/image_entity.dart';
import 'package:toeic/database/entities/question_entity.dart';
import 'package:toeic/database/entities/routine_entity.dart';
import '../apis/models/DateRoutine.dart';
import '../apis/models/Examination.dart';
import '../apis/models/ExaminationDetailModel.dart';
import '../apis/models/Exams.dart';
import '../apis/models/Level.dart';
import '../apis/models/Part.dart';
import '../apis/models/Routine.dart';
import '../apis/models/Test.dart';
import '../apis/models/TestDetail.dart';
import '../apis/models/TypeTest.dart';
import '../apis/models/user.dart';
import '../database/entities/ResulEntity.dart';
import '../database/entities/examination_entity.dart';
import '../database/entities/user_entity.dart';


abstract class UserRepository {
  // Stream<PieChartState> get pieChartState;
  //
  Map<DateTime, int>? get dateActivities;
  // List<double>? get sumOfTest;

  Future<User> updateLv1( Map<String, dynamic> data);

  Future<User> saveActivityInApp();

  Future<String?> updateUserByAdmin(int userId , FormData formData);

  Future<String?> updateAvatar(FormData formData);

  Future<List<DateRoutine>> getActivities(int year,int month);

  Future<List<double>> getSumOfTest();

  Future<List<double>> getSumOfTestCreated();

  Future<double> getAverageScoreFrom3LastExamination();

  Future<List<double>> getAverageNumberOfScoreEachPartFrom3LastExamination();

  Future<List<Part>> getAllPart(int skip, int limit );

  Future<List<Level>> getAllLevel( int skip, int limit);

  Future<List<TypeTest>> getAllTypeTest(int skip, int limit);

  Future<void> saveAllPart(List<Part> parts);
  Future<void> saveAllLevel(List<Level> levels);
  Future<void> saveAllTypeTest(List<TypeTest> types);
  Future<void> saveAllTests(List<Test> tests);

  Future<List<Examination>> getExaminationByMaxId(int id);
  Future<void> saveAllExamination(List<Examination> entities);
  Future<List<Routine>> getRoutineFromMaxId( int maxId);
  Future<void> saveAllRoutine(List<Routine> entities);
  Future<void> saveUser(User? user);
  Future<double> getAverageScoreFrom3LastExaminationFromDB();
  Future<User?> getUserFromDb();
  Future<List<double>> getNumberOfUserTested();
  Future<List<double>> getNumberOfTestCreated();
  Future<List<double>> getAverageNumberOfScoreEachPartFrom3LastExaminationFromDB();
  Future<void> getActivityFromDB(String year, String month);
  Future<RoutineEntity?> getRoutineByDateFromDB(
      String year, String month, String date);

  Future<List<TestDetail>> getListTestDetailByListTestId(List<int> data);
  Future<void> insertTestDetailEntities(List<TestDetail> testDetails);
  Future<List<Exams>> getExamByListExamId(List<int> data);
  Future<void> insertExamEntities(List<ExamEntity> data);
  Future<void> insertQuestionEntities(List<QuestionEntity> data);
  Future<void> insertImageEntities(List<ImageEntity> data);
  Future<List<ExamEntity>> getListExamByTestId(int testId);
  Future<UserEntity?> getUserById(int id);
  Future<List<ExaminationDetailModel>> getExaminationDetailByListExaminationId(List<int> data);
  Future<void> insertExaminationDetails(List<ExaminationDetailModel> data);
  Future<Examination?> getTheLastExaminationByTestId(int testId);
  Future<ExaminationEntity?> getExaminationHaveNotFinished(int userId, int testId);
  Future<int?> getTypeTestIdByTestId(int id);
  Future<void> createExaminationEntity(ExaminationEntity entity);
  Future<Examination> getExaminationByIdFromDB(int id);
  // Future<ResultEntity?> getAnswerByQuestionId(int id);
}