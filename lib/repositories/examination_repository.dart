import '../apis/models/Examination.dart';
import '../features/practice/cubit/test_cubit.dart';

abstract class ExaminationRepository {
  Examination? examination ;

  Stream<TestState> get testStateStream;

  Future<Examination> startExamination(int testId);

  Future<Examination> submitExamination(int examinationId, int totalTime, Map<String, dynamic> data);

  Future<Examination> getExamination(int examinationId);

  Future<List<Examination>> getListExaminationByUser();

  Future<List<Examination>> getHistory(int skip, int limit);
}