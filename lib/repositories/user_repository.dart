

import 'package:dio/dio.dart';
import 'package:toeic/features/home/cubit/home_cubit.dart';
import 'package:toeic/features/home/cubit/piechart_cubit.dart';

import '../apis/models/DateRoutine.dart';
import '../apis/models/Level.dart';
import '../apis/models/Number_of_examination.dart';
import '../apis/models/Part.dart';
import '../apis/models/Test.dart';
import '../apis/models/TypeTest.dart';
import '../apis/models/user.dart';
import '../features/home/cubit/piechart_cubit.dart';
import '../features/home/cubit/piechart_cubit.dart';

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

  Future<List<Part>> getAllPart( int limit, int skip);

  Future<List<Level>> getAllLevel( int limit,  int skip);

  Future<List<TypeTest>> getAllTypeTest( int limit,  int skip);
}