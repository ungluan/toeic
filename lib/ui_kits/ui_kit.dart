import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toeic/ui_kits/styles.dart';

Widget buildTitle(String title, {bool isAsterisk = true}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 4),
    child: Row(
      children: [
        Text(
          title,
          textAlign: TextAlign.left,
          style: textTitleStyle.copyWith(fontWeight: FontWeight.bold),
        ),
        isAsterisk
            ? Text(
          '*',
          textAlign: TextAlign.left,
          style: textTitleStyle.copyWith(
              color: Colors.red, fontWeight: FontWeight.bold),
        )
            : const SizedBox(),
      ],
    ),
  );
}