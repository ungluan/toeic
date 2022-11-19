/// id : 49
/// url : "1666807332877755_01_01.png"
/// exam_id : 144
/// index : 1

class Images {
  Images({
      int? id, 
      String? url, 
      int? examId, 
      int? index,}){
    _id = id;
    _url = url;
    _examId = examId;
    _index = index;
}

  Images.fromJson(dynamic json) {
    _id = json['id'];
    _url = json['url'];
    _examId = json['exam_id'];
    _index = json['index'];
  }
  int? _id;
  String? _url;
  int? _examId;
  int? _index;

  int? get id => _id;
  String? get url => _url;
  int? get examId => _examId;
  int? get index => _index;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['url'] = _url;
    map['exam_id'] = _examId;
    map['index'] = _index;
    return map;
  }

}