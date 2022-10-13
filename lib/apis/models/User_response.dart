import 'User.dart';

/// access_token : "string"
/// user : {"id":0,"email":"user@example.com","first_name":"string","last_name":"string","phone_number":"string","is_active":true,"phone_verified":true,"created_at":"2022-10-13","birth_date":"2022-10-13","address":"string","gender":"string","avatar":"string","updated_at":"2022-10-13","rule":{"id":0,"name":"string"}}

class UserResponse {
  UserResponse({
      String? accessToken, 
      User? user,}){
    _accessToken = accessToken;
    _user = user;
}

  UserResponse.fromJson(dynamic json) {
    _accessToken = json['access_token'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? _accessToken;
  User? _user;

  String? get accessToken => _accessToken;
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = _accessToken;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}