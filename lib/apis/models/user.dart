import 'rule.dart';

/// id : 33
/// email : "user@example.com"
/// first_name : "string"
/// last_name : "string"
/// phone_number : "string"
/// is_active : true
/// created_at : "2022-10-10"
/// birth_date : "2022-10-10"
/// address : "string"
/// gender : "nam"
/// avatar : "string"
/// updated_at : "2022-10-10"
/// rule : {"id":2,"name":"user"}

class User {
  User({
      int? id, 
      String? email, 
      String? firstName, 
      String? lastName, 
      String? phoneNumber, 
      bool? isActive, 
      String? createdAt,
      String? birthDate, 
      String? address, 
      String? gender, 
      String? avatar, 
      String? updatedAt,
      int? target,
      Rule? rule,}){
    _id = id;
    _email = email;
    _firstName = firstName;
    _lastName = lastName;
    _phoneNumber = phoneNumber;
    _isActive = isActive;
    _createdAt = createdAt;
    _birthDate = birthDate;
    _address = address;
    _gender = gender;
    _avatar = avatar;
    _updatedAt = updatedAt;
    _target = target;
    _rule = rule;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _email = json['email'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _phoneNumber = json['phone_number'];
    _isActive = json['is_active'];
    _createdAt = json['created_at'];
    _birthDate = json['birth_date'];
    _address = json['address'];
    _gender = json['gender'];
    _avatar = json['avatar'];
    _updatedAt = json['updated_at'];
    _target = json['target'];
    _rule = json['rule'] != null ? Rule.fromJson(json['rule']) : null;
  }
  int? _id;
  String? _email;
  String? _firstName;
  String? _lastName;
  String? _phoneNumber;
  bool? _isActive;
  String? _createdAt;
  String? _birthDate;
  String? _address;
  String? _gender;
  String? _avatar;
  String? _updatedAt;
  int? _target;
  Rule? _rule;

  int? get id => _id;
  String? get email => _email;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get phoneNumber => _phoneNumber;
  bool? get isActive => _isActive;
  String? get createdAt => _createdAt;
  String? get birthDate => _birthDate;
  String? get address => _address;
  String? get gender => _gender;
  String? get avatar => _avatar;
  String? get updatedAt => _updatedAt;
  int? get target => _target;
  Rule? get rule => _rule;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['email'] = _email;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['phone_number'] = _phoneNumber;
    map['is_active'] = _isActive;
    map['created_at'] = _createdAt;
    map['birth_date'] = _birthDate;
    map['address'] = _address;
    map['gender'] = _gender;
    map['avatar'] = _avatar;
    map['target'] = _target;
    map['updated_at'] = _updatedAt;
    if (_rule != null) {
      map['rule'] = _rule?.toJson();
    }
    return map;
  }

}