/// email : "đã tồn tại"
/// phone_number : "đã tồn tại"

class Detail {
  Detail({
      String? email, 
      String? phoneNumber,}){
    _email = email;
    _phoneNumber = phoneNumber;
}

  Detail.fromJson(dynamic json) {
    _email = json['email'];
    _phoneNumber = json['phone_number'];
  }
  String? _email;
  String? _phoneNumber;

  String? get email => _email;
  String? get phoneNumber => _phoneNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['phone_number'] = _phoneNumber;
    return map;
  }

}