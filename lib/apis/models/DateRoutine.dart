/// created_at : "2022-12-01"

class DateRoutine {
  DateRoutine({
      String? createdAt,}){
    _createdAt = createdAt;
}

  DateRoutine.fromJson(dynamic json) {
    _createdAt = json['created_at'];
  }
  String? _createdAt;
DateRoutine copyWith({  String? createdAt,
}) => DateRoutine(  createdAt: createdAt ?? _createdAt,
);
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['created_at'] = _createdAt;
    return map;
  }

}