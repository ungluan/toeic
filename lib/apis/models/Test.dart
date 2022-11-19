import 'TypeTest.dart';
import 'Exams.dart';

/// id : 3
/// type_test : {"id":1,"name":"Thực hành 1"}
/// target : 500
/// user_id : 2
/// created_at : "2022-11-13T10:21:08.496331"
/// exams : [{"id":14,"paragraph":"","audio":"1668334999455553_C:/Users/TruongLuan/Downloads/Test_Toeic/listening/part1/01_01.mp3","part":{"id":1,"name":"Part 1"},"level":{"id":1,"name":"Dễ"},"images":[{"id":15,"url":"1668335007513281_C:/Users/TruongLuan/Downloads/Test_Toeic/listening/part1/01_01.png","exam_id":14,"index":1}],"questions":[{"id":15,"content":"","explain":"(A) The woman is talking on the phone.\n(B) The woman is using her cell phone.\n(C) The woman is typing on the laptop.\n(D) The woman is writing in her notebook.","a":"a","b":"b","c":"c","d":"d","answer":"a"}]},{"id":15,"paragraph":"","audio":"1668335000831690_C:/Users/TruongLuan/Downloads/Test_Toeic/listening/part1/01_02.mp3","part":{"id":1,"name":"Part 1"},"level":{"id":1,"name":"Dễ"},"images":[{"id":16,"url":"1668335008543598_C:/Users/TruongLuan/Downloads/Test_Toeic/listening/part1/01_02.png","exam_id":15,"index":1}],"questions":[{"id":16,"content":"","explain":"(A) The woman is cooking some bacon.\n(B) The woman is baking a cake.\n(C) The woman is preparing for dinner.\n(D) The woman is frying some fish.","a":"a","b":"b","c":"c","d":"d","answer":"a"}]},{"id":16,"paragraph":"","audio":"1668335001947002_C:/Users/TruongLuan/Downloads/Test_Toeic/listening/part1/01_03.mp3","part":{"id":1,"name":"Part 1"},"level":{"id":2,"name":"Trung bình"},"images":[{"id":17,"url":"1668335009469504_C:/Users/TruongLuan/Downloads/Test_Toeic/listening/part1/01_03.png","exam_id":16,"index":1}],"questions":[{"id":17,"content":"","explain":"(A) The man is holding some seafood.\n(B) The woman is baking a crab.\n(C) They are scared of the crab.\n(D) The family is shopping for breakfast.","a":"a","b":"b","c":"c","d":"d","answer":"a"}]},{"id":17,"paragraph":"","audio":"1668335003036735_C:/Users/TruongLuan/Downloads/Test_Toeic/listening/part1/01_04.mp3","part":{"id":1,"name":"Part 1"},"level":{"id":2,"name":"Trung bình"},"images":[{"id":18,"url":"1668335010442523_C:/Users/TruongLuan/Downloads/Test_Toeic/listening/part1/01_04.png","exam_id":17,"index":1}],"questions":[{"id":18,"content":"","explain":"(A) The man is using a screwdriver to screw a nail into the building frame.\n(B) The man is hammering something into a building frame.\n(C) The man is making the frame with his hand.\n(D) The man is wearing protective glasses.","a":"a","b":"b","c":"c","d":"d","answer":"b"}]},{"id":18,"paragraph":"","audio":"1668335004143155_C:/Users/TruongLuan/Downloads/Test_Toeic/listening/part1/01_05.mp3","part":{"id":1,"name":"Part 1"},"level":{"id":3,"name":"Khó"},"images":[{"id":19,"url":"1668335011430307_C:/Users/TruongLuan/Downloads/Test_Toeic/listening/part1/01_05.png","exam_id":18,"index":1}],"questions":[{"id":19,"content":"","explain":"(A) There are some tables and chairs outdoors.\n(B) There are some people sitting at the tables.\n(C) There are plastic umbrellas on the tables.\n(D) There are many flowers in the garden.","a":"a","b":"b","c":"c","d":"d","answer":"a"}]},{"id":19,"paragraph":"","audio":"1668335006110965_C:/Users/TruongLuan/Downloads/Test_Toeic/listening/part1/01_06.mp3","part":{"id":1,"name":"Part 1"},"level":{"id":3,"name":"Khó"},"images":[{"id":20,"url":"1668335012427203_C:/Users/TruongLuan/Downloads/Test_Toeic/listening/part1/01_06.png","exam_id":19,"index":1}],"questions":[{"id":20,"content":"","explain":"(A) They are looking at each other.\n(B) The woman is typing on her computer.\n(C) The man is using the calculator.\n(D) The man is writing something onto the notepad.","a":"a","b":"b","c":"c","d":"d","answer":"d"}]}]

class Test {
  Test({
      int? id, 
      TypeTest? typeTest, 
      int? target, 
      int? userId, 
      String? createdAt, 
      List<Exams>? exams,}){
    _id = id;
    _typeTest = typeTest;
    _target = target;
    _userId = userId;
    _createdAt = createdAt;
    _exams = exams;
}

  Test.fromJson(dynamic json) {
    _id = json['id'];
    _typeTest = json['type_test'] != null ? TypeTest.fromJson(json['type_test']) : null;
    _target = json['target'];
    _userId = json['user_id'];
    _createdAt = json['created_at'];
    if (json['exams'] != null) {
      _exams = [];
      json['exams'].forEach((v) {
        _exams?.add(Exams.fromJson(v));
      });
    }
  }
  int? _id;
  TypeTest? _typeTest;
  int? _target;
  int? _userId;
  String? _createdAt;
  List<Exams>? _exams;
Test copyWith({  int? id,
  TypeTest? typeTest,
  int? target,
  int? userId,
  String? createdAt,
  List<Exams>? exams,
}) => Test(  id: id ?? _id,
  typeTest: typeTest ?? _typeTest,
  target: target ?? _target,
  userId: userId ?? _userId,
  createdAt: createdAt ?? _createdAt,
  exams: exams ?? _exams,
);
  int? get id => _id;
  TypeTest? get typeTest => _typeTest;
  int? get target => _target;
  int? get userId => _userId;
  String? get createdAt => _createdAt;
  List<Exams>? get exams => _exams;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_typeTest != null) {
      map['type_test'] = _typeTest?.toJson();
    }
    map['target'] = _target;
    map['user_id'] = _userId;
    map['created_at'] = _createdAt;
    if (_exams != null) {
      map['exams'] = _exams?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}