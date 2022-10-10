import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

ButtonStyle get solidFowButtonStyle => ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    backgroundColor: MaterialStateProperty.all<Color>(blueColor),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        )));

ButtonStyle get deleteFowButtonStyle => ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    backgroundColor: MaterialStateProperty.all<Color>(const Color(0xfff0f5ff)),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        )));

ButtonStyle get solidDisableFowButtonStyle => ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        )));

ButtonStyle get fowButtonStyle => ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: blueColor, width: 2))));

ButtonStyle get fowButtonNoBorderStyle => ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.transparent, width: 2))));

TextStyle get textFowButtonStyle => GoogleFonts.aBeeZee(
    fontSize: 16, letterSpacing: 1.33, fontWeight: FontWeight.bold);

TextStyle get textItemMenuStyle =>
    GoogleFonts.aBeeZee(fontSize: 12, color: menuItemColor);

TextStyle get textTitleStyle => GoogleFonts.aBeeZee(
    fontSize: 14, color: darkBlueColor, fontWeight: FontWeight.w500);

TextStyle get textContentStyle =>
    GoogleFonts.aBeeZee(fontSize: 14, color: Colors.black);

TextStyle get aBeeZeeStyle => GoogleFonts.aBeeZee(
  textStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
);

ButtonStyle get miniButtonStyle => TextButton.styleFrom(
    minimumSize: Size(100, 30),
    padding: EdgeInsets.symmetric(horizontal: 12.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    backgroundColor: blueColor);

ButtonStyle get miniBorderButtonStyle => TextButton.styleFrom(
    minimumSize: Size(100, 30),
    padding: EdgeInsets.symmetric(vertical: 0.0),
    shape: const RoundedRectangleBorder(
      side: BorderSide(color: FowColors.blueColor),
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
    backgroundColor: Colors.white);
