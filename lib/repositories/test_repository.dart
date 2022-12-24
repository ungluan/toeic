import 'package:toeic/features/practice/cubit/test_cubit.dart';

import '../apis/models/Examination.dart';
import '../apis/models/Test.dart';

abstract class TestRepository {
  // Stream<List<Test>> get testsStream;
  // List<Test>? get tests;
  // Stream<Map<String, dynamic>> get dataStream;
  // Stream<TestState> get testStateStream;
  Future<List<Test>> getListTestByTypeTest(int typeTestId, int target);
  Future<List<Examination?>> getListExaminationByTestsId(List<int> testsId);
  Future<List<Test>> getTestsFromMaxId(int maxId);

}