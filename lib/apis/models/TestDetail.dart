/// test_id : 8
/// exam_id : 106
/// id : 106

class TestDetail {
  TestDetail({
      int? testId, 
      int? examId, 
      int? id,}){
    _testId = testId;
    _examId = examId;
    _id = id;
}

  TestDetail.fromJson(dynamic json) {
    _testId = json['test_id'];
    _examId = json['exam_id'];
    _id = json['id'];
  }
  int? _testId;
  int? _examId;
  int? _id;
TestDetail copyWith({  int? testId,
  int? examId,
  int? id,
}) => TestDetail(  testId: testId ?? _testId,
  examId: examId ?? _examId,
  id: id ?? _id,
);
  int? get testId => _testId;
  int? get examId => _examId;
  int? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['test_id'] = _testId;
    map['exam_id'] = _examId;
    map['id'] = _id;
    return map;
  }

}