/// question_id : 7
/// examination_id : 1
/// id : 314
/// selection : "c"

class ExaminationDetailModel {
  ExaminationDetailModel({
      int? questionId, 
      int? examinationId, 
      int? id, 
      String? selection,}){
    _questionId = questionId;
    _examinationId = examinationId;
    _id = id;
    _selection = selection;
}

  ExaminationDetailModel.fromJson(dynamic json) {
    _questionId = json['question_id'];
    _examinationId = json['examination_id'];
    _id = json['id'];
    _selection = json['selection'];
  }
  int? _questionId;
  int? _examinationId;
  int? _id;
  String? _selection;
ExaminationDetailModel copyWith({  int? questionId,
  int? examinationId,
  int? id,
  String? selection,
}) => ExaminationDetailModel(  questionId: questionId ?? _questionId,
  examinationId: examinationId ?? _examinationId,
  id: id ?? _id,
  selection: selection ?? _selection,
);
  int? get questionId => _questionId;
  int? get examinationId => _examinationId;
  int? get id => _id;
  String? get selection => _selection;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['question_id'] = _questionId;
    map['examination_id'] = _examinationId;
    map['id'] = _id;
    map['selection'] = _selection;
    return map;
  }

}