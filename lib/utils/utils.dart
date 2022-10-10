

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

