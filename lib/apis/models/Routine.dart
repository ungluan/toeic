/// user_id : 5
/// created_at : "2022-12-21T15:04:57.017508"
/// total_time : 0
/// number_of_practice : 0
/// number_of_test : 0
/// id : 187

class Routine {
  Routine({
      int? userId, 
      String? createdAt, 
      int? totalTime, 
      int? numberOfPractice, 
      int? numberOfTest, 
      int? id,}){
    _userId = userId;
    _createdAt = createdAt;
    _totalTime = totalTime;
    _numberOfPractice = numberOfPractice;
    _numberOfTest = numberOfTest;
    _id = id;
}

  Routine.fromJson(dynamic json) {
    _userId = json['user_id'];
    _createdAt = json['created_at'];
    _totalTime = json['total_time'];
    _numberOfPractice = json['number_of_practice'];
    _numberOfTest = json['number_of_test'];
    _id = json['id'];
  }
  int? _userId;
  String? _createdAt;
  int? _totalTime;
  int? _numberOfPractice;
  int? _numberOfTest;
  int? _id;
Routine copyWith({  int? userId,
  String? createdAt,
  int? totalTime,
  int? numberOfPractice,
  int? numberOfTest,
  int? id,
}) => Routine(  userId: userId ?? _userId,
  createdAt: createdAt ?? _createdAt,
  totalTime: totalTime ?? _totalTime,
  numberOfPractice: numberOfPractice ?? _numberOfPractice,
  numberOfTest: numberOfTest ?? _numberOfTest,
  id: id ?? _id,
);
  int? get userId => _userId;
  String? get createdAt => _createdAt;
  int? get totalTime => _totalTime;
  int? get numberOfPractice => _numberOfPractice;
  int? get numberOfTest => _numberOfTest;
  int? get id => _id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = _userId;
    map['created_at'] = _createdAt;
    map['total_time'] = _totalTime;
    map['number_of_practice'] = _numberOfPractice;
    map['number_of_test'] = _numberOfTest;
    map['id'] = _id;
    return map;
  }

}