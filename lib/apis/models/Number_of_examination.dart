/// type_test_id : 1
/// total : 7

class NumberOfExamination {
  NumberOfExamination({
      int? typeTestId, 
      int? total,}){
    _typeTestId = typeTestId;
    _total = total;
}

  NumberOfExamination.fromJson(dynamic json) {
    _typeTestId = json['type_test_id'];
    _total = json['total'];
  }
  int? _typeTestId;
  int? _total;
NumberOfExamination copyWith({  int? typeTestId,
  int? total,
}) => NumberOfExamination(  typeTestId: typeTestId ?? _typeTestId,
  total: total ?? _total,
);
  int? get typeTestId => _typeTestId;
  int? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type_test_id'] = _typeTestId;
    map['total'] = _total;
    return map;
  }

}