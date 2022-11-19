import 'User.dart';
import 'Test.dart';

/// id : 0
/// test_id : 0
/// user_id : 0
/// number_correct_part_1 : 0
/// number_correct_part_2 : 0
/// number_correct_part_3 : 0
/// number_correct_part_4 : 0
/// number_correct_part_5 : 0
/// number_correct_part_6 : 0
/// number_correct_part_7 : 0
/// started_at : "2022-11-17T07:33:06.588Z"
/// finished_at : "2022-11-17T07:33:06.588Z"
/// user : {"id":0,"email":"user@example.com","first_name":"string","password":"string","last_name":"string","phone_number":"string","is_active":true,"created_at":"2022-11-17","birth_date":"2022-11-17","address":"string","gender":"string","avatar":"string","updated_at":"2022-11-17","rule":{"id":0,"name":"string"},"target":0}
/// test : {"id":0,"type_test":{"id":0,"name":"string"},"target":0,"user_id":0,"created_at":"2022-11-17T07:33:06.589Z","exams":[{"id":0,"paragraph":"string","audio":"string","part":{"id":0,"name":"string"},"level":{"id":0,"name":"string"},"images":[{"id":0,"url":"string","exam_id":0,"index":1}],"questions":[{"id":0,"content":"string","explain":"string","a":"string","b":"string","c":"string","d":"string","answer":"string"}]}]}

class Examination {
  Examination({
      int? id, 
      int? testId, 
      int? userId, 
      int? numberCorrectPart1, 
      int? numberCorrectPart2, 
      int? numberCorrectPart3, 
      int? numberCorrectPart4, 
      int? numberCorrectPart5, 
      int? numberCorrectPart6, 
      int? numberCorrectPart7, 
      String? startedAt, 
      String? finishedAt, 
      User? user, 
      Test? test,}){
    _id = id;
    _testId = testId;
    _userId = userId;
    _numberCorrectPart1 = numberCorrectPart1;
    _numberCorrectPart2 = numberCorrectPart2;
    _numberCorrectPart3 = numberCorrectPart3;
    _numberCorrectPart4 = numberCorrectPart4;
    _numberCorrectPart5 = numberCorrectPart5;
    _numberCorrectPart6 = numberCorrectPart6;
    _numberCorrectPart7 = numberCorrectPart7;
    _startedAt = startedAt;
    _finishedAt = finishedAt;
    _user = user;
    _test = test;
}

  Examination.fromJson(dynamic json) {
    _id = json['id'];
    _testId = json['test_id'];
    _userId = json['user_id'];
    _numberCorrectPart1 = json['number_correct_part_1'];
    _numberCorrectPart2 = json['number_correct_part_2'];
    _numberCorrectPart3 = json['number_correct_part_3'];
    _numberCorrectPart4 = json['number_correct_part_4'];
    _numberCorrectPart5 = json['number_correct_part_5'];
    _numberCorrectPart6 = json['number_correct_part_6'];
    _numberCorrectPart7 = json['number_correct_part_7'];
    _startedAt = json['started_at'];
    _finishedAt = json['finished_at'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _test = json['test'] != null ? Test.fromJson(json['test']) : null;
  }
  int? _id;
  int? _testId;
  int? _userId;
  int? _numberCorrectPart1;
  int? _numberCorrectPart2;
  int? _numberCorrectPart3;
  int? _numberCorrectPart4;
  int? _numberCorrectPart5;
  int? _numberCorrectPart6;
  int? _numberCorrectPart7;
  String? _startedAt;
  String? _finishedAt;
  User? _user;
  Test? _test;
Examination copyWith({  int? id,
  int? testId,
  int? userId,
  int? numberCorrectPart1,
  int? numberCorrectPart2,
  int? numberCorrectPart3,
  int? numberCorrectPart4,
  int? numberCorrectPart5,
  int? numberCorrectPart6,
  int? numberCorrectPart7,
  String? startedAt,
  String? finishedAt,
  User? user,
  Test? test,
}) => Examination(  id: id ?? _id,
  testId: testId ?? _testId,
  userId: userId ?? _userId,
  numberCorrectPart1: numberCorrectPart1 ?? _numberCorrectPart1,
  numberCorrectPart2: numberCorrectPart2 ?? _numberCorrectPart2,
  numberCorrectPart3: numberCorrectPart3 ?? _numberCorrectPart3,
  numberCorrectPart4: numberCorrectPart4 ?? _numberCorrectPart4,
  numberCorrectPart5: numberCorrectPart5 ?? _numberCorrectPart5,
  numberCorrectPart6: numberCorrectPart6 ?? _numberCorrectPart6,
  numberCorrectPart7: numberCorrectPart7 ?? _numberCorrectPart7,
  startedAt: startedAt ?? _startedAt,
  finishedAt: finishedAt ?? _finishedAt,
  user: user ?? _user,
  test: test ?? _test,
);
  int? get id => _id;
  int? get testId => _testId;
  int? get userId => _userId;
  int? get numberCorrectPart1 => _numberCorrectPart1;
  int? get numberCorrectPart2 => _numberCorrectPart2;
  int? get numberCorrectPart3 => _numberCorrectPart3;
  int? get numberCorrectPart4 => _numberCorrectPart4;
  int? get numberCorrectPart5 => _numberCorrectPart5;
  int? get numberCorrectPart6 => _numberCorrectPart6;
  int? get numberCorrectPart7 => _numberCorrectPart7;
  String? get startedAt => _startedAt;
  String? get finishedAt => _finishedAt;
  User? get user => _user;
  Test? get test => _test;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['test_id'] = _testId;
    map['user_id'] = _userId;
    map['number_correct_part_1'] = _numberCorrectPart1;
    map['number_correct_part_2'] = _numberCorrectPart2;
    map['number_correct_part_3'] = _numberCorrectPart3;
    map['number_correct_part_4'] = _numberCorrectPart4;
    map['number_correct_part_5'] = _numberCorrectPart5;
    map['number_correct_part_6'] = _numberCorrectPart6;
    map['number_correct_part_7'] = _numberCorrectPart7;
    map['started_at'] = _startedAt;
    map['finished_at'] = _finishedAt;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    if (_test != null) {
      map['test'] = _test?.toJson();
    }
    return map;
  }

}