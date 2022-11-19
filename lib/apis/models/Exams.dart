import 'Level.dart';
import 'Part.dart';
import 'Images.dart';
import 'Questions.dart';

/// id : 144
/// paragraph : ""
/// audio : "1666807316395004_01_01.mp3"
/// part : {"id":1,"name":"Part 1"}
/// images : [{"id":49,"url":"1666807332877755_01_01.png","exam_id":144,"index":1}]
/// questions : [{"id":159,"content":"","explain":"(A) The woman is talking on the phone.\n(B) The woman is using her cell phone.\n(C) The woman is typing on the laptop.\n(D) The woman is writing in her notebook.","a":"a","b":"b","c":"c","d":"d","answer":"a"}]

class Exams {
  Exams({
      int? id, 
      String? paragraph, 
      String? audio, 
      Part? part,
      Level? level,
      List<Images>? images, 
      List<Questions>? questions,}){
    _id = id;
    _paragraph = paragraph;
    _audio = audio;
    _level = level;
    _part = part;
    _images = images;
    _questions = questions;

}

  Exams.fromJson(dynamic json) {
    _id = json['id'];
    _paragraph = json['paragraph'];
    _audio = json['audio'];
    _part = json['part'] != null ? Part.fromJson(json['part']) : null;
    _level = json['level'] != null ? Level.fromJson(json['level']) : null;
    if (json['images'] != null) {
      _images = [];
      json['images'].forEach((v) {
        _images?.add(Images.fromJson(v));
      });
    }
    if (json['questions'] != null) {
      _questions = [];
      json['questions'].forEach((v) {
        _questions?.add(Questions.fromJson(v));
      });
    }
  }
  int? _id;
  String? _paragraph;
  String? _audio;
  Part? _part;
  Level? _level;
  List<Images>? _images;
  List<Questions>? _questions;


  int? get id => _id;
  String? get paragraph => _paragraph;
  String? get audio => _audio;
  Part? get part => _part;
  Level? get level => _level;
  List<Images>? get images => _images;
  List<Questions>? get questions => _questions;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['paragraph'] = _paragraph;
    map['audio'] = _audio;
    map['level'] = _level;
    if (_part != null) {
      map['part'] = _part?.toJson();
    }
    if (_images != null) {
      map['images'] = _images?.map((v) => v.toJson()).toList();
    }
    if (_questions != null) {
      map['questions'] = _questions?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}