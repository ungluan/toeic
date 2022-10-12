import 'Detail.dart';

/// detail : {"email":"đã tồn tại","phone_number":"đã tồn tại"}

class VerifyResponse {
  VerifyResponse({
      Detail? detail,}){
    _detail = detail;
}

  VerifyResponse.fromJson(dynamic json) {
    _detail = json['detail'] != null ? Detail.fromJson(json['detail']) : null;
  }
  Detail? _detail;

  Detail? get detail => _detail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_detail != null) {
      map['detail'] = _detail?.toJson();
    }
    return map;
  }

}