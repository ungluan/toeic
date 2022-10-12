import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';

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
  final nineNumberPhone = trimStart(phoneNumber);
  if (nineNumberPhone.length == 12 &&
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
    return 'Invalid Email';
  }
}

String? validatorFirstName(String? name) {
  return (name != null && name.isNotEmpty) == true ? null : 'First Name isn\'t empty';
}
String? validatorLastName(String? name) {
  return (name != null && name.isNotEmpty) == true ? null : 'Last Name isn\'t empty';
}

String digitFormat(int? number) {
  if (number == null) return '00';
  var f = NumberFormat("00");
  return f.format(number);
}
