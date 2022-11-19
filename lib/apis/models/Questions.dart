/// id : 159
/// content : ""
/// explain : "(A) The woman is talking on the phone.\n(B) The woman is using her cell phone.\n(C) The woman is typing on the laptop.\n(D) The woman is writing in her notebook."
/// a : "a"
/// b : "b"
/// c : "c"
/// d : "d"
/// answer : "a"

class Questions {
  Questions({
      int? id, 
      String? content, 
      String? explain, 
      String? a, 
      String? b, 
      String? c, 
      String? d, 
      String? answer,}){
    _id = id;
    _content = content;
    _explain = explain;
    _a = a;
    _b = b;
    _c = c;
    _d = d;
    _answer = answer;
}

  Questions.fromJson(dynamic json) {
    _id = json['id'];
    _content = json['content'];
    _explain = json['explain'];
    _a = json['a'];
    _b = json['b'];
    _c = json['c'];
    _d = json['d'];
    _answer = json['answer'];
  }
  int? _id;
  String? _content;
  String? _explain;
  String? _a;
  String? _b;
  String? _c;
  String? _d;
  String? _answer;

  int? get id => _id;
  String? get content => _content;
  String? get explain => _explain;
  String? get a => _a;
  String? get b => _b;
  String? get c => _c;
  String? get d => _d;
  String? get answer => _answer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['content'] = _content;
    map['explain'] = _explain;
    map['a'] = _a;
    map['b'] = _b;
    map['c'] = _c;
    map['d'] = _d;
    map['answer'] = _answer;
    return map;
  }

}