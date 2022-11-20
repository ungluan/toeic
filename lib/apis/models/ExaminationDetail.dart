import 'Question.dart';

/// id : 7
/// examination_id : 10
/// question : {"id":21,"content":"","explain":"(A) The woman is talking on the phone.\n(B) The woman is using her cell phone.\n(C) The woman is typing on the laptop.\n(D) The woman is writing in her notebook.","a":"a","b":"b","c":"c","d":"d","answer":"a"}
/// selection : "a"

class ExaminationDetail {
  ExaminationDetail({
    int? id,
    int? examinationId,
    Question? question,
    String? selection,
  }) {
    _id = id;
    _examinationId = examinationId;
    _question = question;
    _selection = selection;
  }

  ExaminationDetail.fromJson(dynamic json) {
    _id = json['id'];
    _examinationId = json['examination_id'];
    _question =
        json['question'] != null ? Question.fromJson(json['question']) : null;
    _selection = json['selection'];
  }

  int? _id;
  int? _examinationId;
  Question? _question;
  String? _selection;

  ExaminationDetail copyWith({
    int? id,
    int? examinationId,
    Question? question,
    String? selection,
  }) =>
      ExaminationDetail(
        id: id ?? _id,
        examinationId: examinationId ?? _examinationId,
        question: question ?? _question,
        selection: selection ?? _selection,
      );

  int? get id => _id;

  int? get examinationId => _examinationId;

  Question? get question => _question;

  String? get selection => _selection;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['examination_id'] = _examinationId;
    if (_question != null) {
      map['question'] = _question?.toJson();
    }
    map['selection'] = _selection;
    return map;
  }
}
