import '../apis/models/Examination.dart';
import '../apis/models/Test.dart';

abstract class TestRepository {
  Future<List<Test>> getListTestByTypeTest(int typeTestId, int target);
  Future<List<Examination?>> getListExaminationByTestsId(List<int> testsId);
}