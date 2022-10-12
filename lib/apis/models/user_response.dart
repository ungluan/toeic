import 'package:toeic/apis/models/user.dart';

/// access_token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJsdWFuQGdtYWlsLmNvbSIsImV4cCI6MTY2ODE0NTc5MX0.OjdtxqAoI819NlJM8eQVGC6APKov_Hja1xl1l9aObtg"
/// data : {"id":6,"email":"luan@gmail.com","first_name":"Ung Nguyen Truong","last_name":"Luan","phone_number":"0382916020","is_active":true,"phone_verified":null,"created_at":"2022-10-12","birth_date":null,"address":null,"gender":null,"avatar":null,"updated_at":null,"rule":{"id":2,"name":"User"}}

class UserResponse {
  UserResponse({
      String? accessToken, 
      User? data,}){
    _accessToken = accessToken;
    _data = data;
}

  UserResponse.fromJson(dynamic json) {
    _accessToken = json['access_token'];
    _data = json['data'] != null ? User.fromJson(json['data']) : null;
  }
  String? _accessToken;
  User? _data;

  String? get accessToken => _accessToken;
  User? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = _accessToken;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}