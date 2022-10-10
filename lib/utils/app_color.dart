import 'package:flutter/material.dart';

class AppColor extends ChangeNotifier {
  AppColor();

  static Map<int, Color> color = {
    50: const Color.fromRGBO(76, 175, 80, .1),
    100: const Color.fromRGBO(76, 175, 80, .2),
    200: const Color.fromRGBO(76, 175, 80, .3),
    300: const Color.fromRGBO(76, 175, 80, .4),
    400: const Color.fromRGBO(76, 175, 80, .5),
    500: const Color.fromRGBO(76, 175, 80, .6),
    600: const Color.fromRGBO(76, 175, 80, .7),
    700: const Color.fromRGBO(76, 175, 80, .8),
    800: const Color.fromRGBO(76, 175, 80, .9),
    900: const Color.fromRGBO(76, 175, 80, 1),
  };

  // static Color colorNavajoWhite = const Color(0xFF4CAF50); // Green
  static const Color primary = Color(0xfffd0502);
  static const Color dark = Color(0xFF1d3557);
  static const Color blue = Colors.blue;
  static const Color red = Color(0xFFf94144);
  static const Color notWhite = Color(0xFFEDF0F2);
  static const Color nearlyWhite = Color(0xFFFEFEFE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Colors.grey;
  static const Color darkGrey = Color(0xFF313A44);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);

  static Brightness brightness = Brightness.light;
  static MaterialColor defaultHeaderOSColor = MaterialColor(0xFF087f23, AppColor.color); // dark green
  static MaterialColor primaryColor = MaterialColor(0xFF4CAF50, AppColor.color); // green
  static MaterialColor mainColor = MaterialColor(0xffdd2116, AppColor.color); // red
  static MaterialColor accentColor = MaterialColor(0xFFFFD600, AppColor.color); // yellow
  static MaterialColor dividerColor = MaterialColor(0xFFF1F1F1, AppColor.color); // grey
  static MaterialColor textPrimaryColor = MaterialColor(0xFF000000, color); // black
  static MaterialColor textSecondColor = MaterialColor(0xFFFFFFFF, color); // white
  static MaterialColor primaryHintColor = MaterialColor(0xFFADADAD, color); // gray
  static MaterialColor primaryBorderColor = MaterialColor(0xFFADADAD, color); // gray
  static MaterialColor primarySelectedColor = MaterialColor(0xFFADADAD, color); // gray
  static MaterialColor primaryBackgroundColor = MaterialColor(0xFFFFFFFF, color); // white
  static MaterialColor disabledColor = MaterialColor(0xFFADADAD, color); // gray
  static MaterialColor errorColor = MaterialColor(0xFFEE0707, color); // red
  static MaterialColor cursorColor = MaterialColor(0xFF000000, color); // black
  // static MaterialColor secondBackgroundColor = MaterialColor(0xFFFFFFFF, color); // white
  static MaterialColor shadowColor = MaterialColor(0x42000000, color); // black26

  void switchMode({bool isDarkTheme = false}) {
    if (!isDarkTheme) {
      // Light Mode
      brightness = Brightness.light;
      defaultHeaderOSColor = MaterialColor(0xFF087f23, AppColor.color); // dark green
      primaryColor = MaterialColor(0xFF4CAF50, AppColor.color); // green
      accentColor = MaterialColor(0xFFFFD600, AppColor.color); // yellow
      dividerColor = MaterialColor(0xFFF1F1F1, AppColor.color); // grey
      textPrimaryColor = MaterialColor(0xFF000000, color); // black
      textSecondColor = MaterialColor(0xFFFFFFFF, color); // white
      primaryHintColor = MaterialColor(0xFFADADAD, color); // gray
      primaryBorderColor = MaterialColor(0xFFADADAD, color); // gray
      primarySelectedColor = MaterialColor(0xFFADADAD, color); // gray
      primaryBackgroundColor = MaterialColor(0xFFFFFFFF, color); // white
      disabledColor = MaterialColor(0xFFADADAD, color); // gray
      errorColor = MaterialColor(0xFFEE0707, color); // red
      cursorColor = MaterialColor(0xFF000000, color); // black
      // secondBackgroundColor = MaterialColor(0xFFFFFFFF, color); // white
      shadowColor = MaterialColor(0x42000000, color); // black26
    } else {
      // Dark Mode
      brightness = Brightness.dark;
      defaultHeaderOSColor = MaterialColor(0xFF087f23, AppColor.color); // dark green
      primaryColor = MaterialColor(0xFF4CAF50, AppColor.color); // green
      accentColor = MaterialColor(0xFFFFD600, AppColor.color); // yellow
      dividerColor = MaterialColor(0xFFF1F1F1, AppColor.color); // grey
      textPrimaryColor = MaterialColor(0xFFFFFFFF, color); // white
      textSecondColor = MaterialColor(0xFF000000, color); // black
      primaryHintColor = MaterialColor(0xFFADADAD, color); // gray
      primaryBorderColor = MaterialColor(0xFFADADAD, color); // gray
      primarySelectedColor = MaterialColor(0xFFADADAD, color); // gray
      primaryBackgroundColor = MaterialColor(0xFF000000, color); // black
      disabledColor = MaterialColor(0xFFADADAD, color); // gray
      errorColor = MaterialColor(0xFFEE0707, color); // red
      cursorColor = MaterialColor(0xFFFFFFFF, color); // white
      // secondBackgroundColor = MaterialColor(0xFF000000, color); // black
      shadowColor = MaterialColor(0xFFFFFFFF, color); // white
    }

    notifyListeners();
  }
}
