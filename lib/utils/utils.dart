import 'dart:core';
import 'dart:core';

import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/foundation.dart';

import '../apis/models/gender.dart';

DateTime convertStringToDateTime(String val){
  var token = val.split('/');
  // var date = token[2] + "-" + token[1] + "-" + token[0];
  return DateTime.parse("${token[2]}-${token[1]}-${token[0]}");
}

int createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(100000);
}

String trimStart(String? value) {
  final String phone = value ?? '';
  final nineNumberPhone = phone.replaceFirst(RegExp(r"^0+(?!$)"), "");
  return '0$nineNumberPhone';
}

String trimStartPhone(String? value) {
  final String phone = value ?? '';
  final nineNumberPhone = phone.replaceFirst(RegExp(r"^0+(?!$)"), "");
  return '+84$nineNumberPhone';
}

String? validatorPassword(String? password) {
  RegExp regex =
  RegExp(r'^((?=.*[A-Z])|(?=.*[@$!%*#?&]))[A-Za-z\d@$!%*#?&]{8,20}$');
  if (password != null && regex.hasMatch(password)) {
    return null;
  } else {
    return 'Mật khẩu chứa 8-20 ký tự và chứa ít nhất 1 ký tự in hoa hoặc 1 ký tự đặc biệt.';
  }
}

String? validatorPhoneNumber(String? phoneNumber) {
  // final nineNumberPhone = trimStart(phoneNumber);
  if ((phoneNumber?.length == 9 || (phoneNumber?.length==10 && phoneNumber![0] =='0') ) &&
      RegExp(r'^[0-9]*$').hasMatch(phoneNumber!)) {
    return null;
  } else {
    return 'Số điện thoại không hợp lệ';
  }
}

String? validatorEmail(String? email) {
  RegExp regex = RegExp(
      r'^[^_ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]*$');
  if (email != null &&
      EmailValidator.validate(email) &&
      regex.hasMatch(email)) {
    return null;
  } else {
    return 'Email không hợp lệ.';
  }
}

String? validatorFirstName(String? name) {
  return (name != null && name.isNotEmpty) == true ? null : 'Họ không được để trống';
}
String? validatorLastName(String? name) {
  return (name != null && name.isNotEmpty) == true ? null : 'Tên không được để trống';
}


String digitFormat(int? number) {
  if (number == null) return '00';
  var f = NumberFormat("00");
  return f.format(number);
}

void logger(dynamic data) {
  if (kDebugMode) {
    print('/////');
    print(data);
    print('/////');
  }
}

List<Gender> get genders => [Gender(id: 1, name: "Nam"), Gender(id: 2 ,name: "Nữ")];
List<Gender> get targets => [Gender(id: 1, name: "500"), Gender(id: 2 ,name: "700"), Gender(id: 3 ,name: "900")];

extension MapX on List<Gender> {
  Map<int, String> getMap() {
    final map = <int, String>{};
    forEach((element) {
      map[element.id!] = element.name!;
    });
    return map;
  }

  Map<int, String> getImages() {
    final map = <int, String>{};
    final images = [
      'assets/images/male.svg',
      'assets/images/female.svg',
    ];
    for (int i = 0; i < length; i++) {
      final element = this[i];
      if (i < images.length) map[element.id!] = images[i];
    }
    return map;
  }
}