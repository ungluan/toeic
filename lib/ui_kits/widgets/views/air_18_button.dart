import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:r_dotted_line_border/r_dotted_line_border.dart';

import '../../colors.dart';
import '../../styles.dart';

Widget makeFowButtonNew(
  String title, {
  required VoidCallback? onTap,
  double height = 38,
  double? width,
  bool isEnable = true,
}) =>
    Opacity(
      opacity: isEnable ? 1 : 0.5,
      child: SizedBox(
        height: height,
        width: width ?? double.infinity,
        child: TextButton(
          onPressed: isEnable ? onTap : null,
          style: solidFowButtonStyle,
          child: Text(
            title,
            style: textFowButtonStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );

Widget makeAir18Button(
  String title, {
  required VoidCallback? onTap,
  double height = 50,
  double? width,
  bool isEnable = true,
}) =>
    Opacity(
      opacity: isEnable ? 1 : 0.5,
      child: SizedBox(
        height: height,
        width: width ?? double.infinity,
        child: TextButton(
          onPressed: isEnable ? onTap : null,
          style: solidFowButtonStyle,
          child: Text(
            title.toUpperCase(),
            style: textFowButtonStyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );

Widget makeAir18BorderButton(String title,
        {required VoidCallback onPressed, double height = 50}) =>
    ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: height,
        color: Colors.white,
        width: double.infinity,
        child: TextButton(
          onPressed: onPressed,
          style: fowButtonStyle,
          child: Text(
            title.toUpperCase(),
            style: textFowButtonStyle.copyWith(color: blueColor),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );

Widget makeDashedButton(String title,
    {required VoidCallback onPressed,
    double height = 50,
    bool show = false,
    bool isEnable = true}) {
  return Container(
    width: double.infinity,
    constraints: BoxConstraints(minHeight: height),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: RDottedLineBorder.all(
        color: isEnable ? blueColor : blueColor.withOpacity(0.4),
        width: 1,
        dottedLength: 10,
        dottedSpace: 4,
      ),
    ),
    child: TextButton(
      onPressed: isEnable ? onPressed : null,
      style: fowButtonNoBorderStyle,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (show)
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isEnable
                      ? Colors.green.shade500
                      : Colors.green.shade500.withOpacity(0.4)),
              child: const Icon(
                Icons.check,
                color: Colors.white,
                size: 20,
              ),
            ),
          // Flexible(
          //   child: Align(
          //     alignment: Alignment.center,
          //     child: RichText(text: TextSpan(
          //       text: title,
          //       style: textFowButtonStyle.copyWith(
          //         color: isEnable ? blueColor : blueColor.withOpacity(0.4),
          //       ),
          //     ),),
          //   ),
          // ),
          Flexible(
            child: Text(
              title,
              style: textFowButtonStyle.copyWith(
                color: isEnable ? blueColor : blueColor.withOpacity(0.4),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget makeRoundButton(String title,
    {required VoidCallback onPressed, double height = 50, bool show = false}) {
  return Container(
    width: double.infinity,
    constraints: BoxConstraints(minHeight: height),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: blueColor,
        width: 1,
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (show)
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle, color: Colors.green.shade500),
            child: const Icon(
              Icons.check,
              color: Colors.white,
              size: 20,
            ),
          ),
        TextButton(
          onPressed: onPressed,
          style: fowButtonNoBorderStyle,
          child: Text(
            title,
            style: textFowButtonStyle.copyWith(
              color: blueColor,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget makeDeleteButton(String title,
        {required VoidCallback? onTap,
        double height = 50,
        double? width,
        bool isEnable = true}) =>
    Opacity(
      opacity: isEnable ? 1 : 0.5,
      child: SizedBox(
        height: height,
        width: width ?? double.infinity,
        child: TextButton(
          onPressed: onTap,
          style: deleteFowButtonStyle,
          child: Text(
            title.toUpperCase(),
            style: textFowButtonStyle.copyWith(
              color: const Color(0xffa7bbe1),
            ),
          ),
        ),
      ),
    );

Widget miniButton(String title,
        {required VoidCallback? onTap, bool isEnable = true}) =>
    TextButton(
      onPressed: isEnable ? onTap : null,
      style: miniButtonStyle,
      child: Text(
        title.toUpperCase(),
        style: GoogleFonts.openSans(color: Colors.white),
      ),
    );

Widget miniBorderButton(String title,
        {required VoidCallback? onTap, bool isEnable = true}) =>
    TextButton(
      onPressed: isEnable ? onTap : null,
      style: miniBorderButtonStyle,
      child: Text(
        title.toUpperCase(),
        style: GoogleFonts.openSans(color: blueColor),
      ),
    );

Widget makeFowButtonOops(
  String title, {
  required VoidCallback? onTap,
}) =>
    SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onTap,
        style: solidFowButtonStyle,
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              title.toUpperCase(),
              style: textFowButtonStyle,
              textAlign: TextAlign.center,
            ),
        ),
      ),
    );

Widget makeFowBorderButtonOops(String title,
        {required VoidCallback onPressed}) =>
    Container(
      color: Colors.white,
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: fowButtonStyle,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Text(
            title.toUpperCase(),
            style: textFowButtonStyle.copyWith(color: blueColor),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
