import 'dart:core';
import 'dart:core';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../apis/models/gender.dart';
import '../features/practice/practice_page.dart';
import '../ui_kits/colors.dart';

const String FIREBASE_URL =
    "https://firebasestorage.googleapis.com/v0/b/toeic-bc79c.appspot.com/o";

DateTime convertStringToDateTime(String val) {
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
  if ((phoneNumber?.length == 9 ||
          (phoneNumber?.length == 10 && phoneNumber![0] == '0')) &&
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
  return (name != null && name.isNotEmpty) == true
      ? null
      : 'Họ không được để trống';
}

String? validatorLastName(String? name) {
  return (name != null && name.isNotEmpty) == true
      ? null
      : 'Tên không được để trống';
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

List<Gender> get genders =>
    [Gender(id: 1, name: "Nam"), Gender(id: 2, name: "Nữ")];

List<Gender> get targets => [
      Gender(id: 1, name: "500"),
      Gender(id: 2, name: "700"),
      Gender(id: 3, name: "900")
    ];

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

  String? value(int id) => firstWhere((element) => element.id == id).name;
}

extension Date on String {
  String convertToDate() {
    var token = split('/');
    return '${token[2]}-${token[1]}-${token[0]}';
  }
}

List<PartItem> parts = [
  PartItem(
    imagePath: 'assets/images/picture.png',
    part: "Part 1",
    description: 'Mô tả hình ảnh',
  ),
  PartItem(
    imagePath: 'assets/images/question.png',
    part: "Part 2",
    description: 'Hỏi & đáp',
  ),
  PartItem(
    imagePath: 'assets/images/conversation.png',
    part: "Part 3",
    description: 'Đoạn hội thoại',
  ),
  PartItem(
    imagePath: 'assets/images/speech.png',
    part: "Part 4",
    description: 'Bài nói chuyện',
  ),
  PartItem(
    imagePath: 'assets/images/checklist.png',
    part: "Part 5",
    description: 'Điền vào câu',
  ),
  PartItem(
    imagePath: 'assets/images/copywriting.png',
    part: "Part 6",
    description: 'Điền vào đoạn',
  ),
  PartItem(
    imagePath: 'assets/images/article.png',
    part: "Part 7",
    description: 'Đọc hiểu',
  ),
];

String formatTime(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final hours = twoDigits(duration.inHours);
  final minutes = twoDigits(duration.inMinutes.remainder(60)).toString();
  final seconds = twoDigits(duration.inSeconds.remainder(60)).toString();
  return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
}

extension EqualD on double {
  bool equalWithIntNumber({int? value}) {
    return this / (value ?? toInt()) == 1.0;
  }
}

Widget makeFowImage(String? url,
        {double size = 100, double ratio = 1, double borderRadius = 0}) =>
    url?.isNotEmpty == true
        ? ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: CachedNetworkImage(
              imageUrl: "$FIREBASE_URL/$url?alt=media",
              fit: BoxFit.cover,
              width: size,
              height: ratio * size,
              placeholder: (context, item) => Container(
                color: Colors.grey,
              ),
            ),
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Container(
              width: size,
              color: Colors.grey,
              height: ratio * size,
            ),
          );

Widget buildTestItem() {
  return Card(
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    shadowColor: blueColor,
    borderOnForeground: true,
    elevation: 4,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    semanticContainer: true,
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Text 1',
            style: GoogleFonts.openSans(
                fontSize: 16,
                color: darkBlueColor,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'Thời gian: 120 phút | Câu hỏi: 200',
            style: GoogleFonts.openSans(fontSize: 14, color: lightTextColor),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () => {},
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  child: Chip(
                    backgroundColor: primaryColor.withOpacity(0.5),
                    elevation: 2,
                    padding: EdgeInsets.all(8),
                    label: Text('10/990'),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => {},
                child: Chip(
                  elevation: 2,
                  backgroundColor: Colors.green.withOpacity(0.8),
                  padding: EdgeInsets.all(8),
                  label: Text('Làm lại'),
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}
