import '../apis/models/Examination.dart';

abstract class ExaminationRepository {
  Examination? examination ;

  Future<Examination> startExamination(int testId);

  Future<Examination> submitExamination(int examinationId, Map<String, dynamic> data);

  Future<Examination> getExamination(int examinationId);

  Future<List<Examination>> getListExaminationByUser();
}