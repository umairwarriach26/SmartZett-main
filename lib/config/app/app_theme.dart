import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static Color primary = HexColor("#ed1c24");
  static Color blue = HexColor("#0e4e96");
  static Color gray = HexColor("#808285");
  static Color white = HexColor("#FFFFFF");

  static final ThemeData lightTheme = ThemeData(
      primaryColor: primary,
      primaryColorLight: primary,
      primaryColorDark: primary,
      primarySwatch: Palette.primarySwatch,
      brightness: Brightness.light,
      textTheme: lightTextTheme,
      elevatedButtonTheme: lightButtonTheme,
      fontFamily: 'poppins');

  static final ElevatedButtonThemeData lightButtonTheme =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0))));

  static const TextTheme lightTextTheme = TextTheme(
    titleLarge: _titleLight,
    titleMedium: _subTitleLight,
    titleSmall: _buttonLight,
  );

  static const TextStyle _titleLight =
      TextStyle(color: Colors.black, fontSize: 20.0, fontFamily: 'poppins');

  static const TextStyle _subTitleLight =
      TextStyle(color: Colors.black, fontSize: 18, fontFamily: 'poppins');

  static const TextStyle _buttonLight =
      TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'poppins');
}

class Palette {
  static MaterialColor primarySwatch = const MaterialColor(
    0xffed1c24, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xffed1c24), //10%
      100: Color(0xffed1c24), //20%
      200: Color(0xffed1c24), //30%
      300: Color(0xffed1c24), //40%
      400: Color(0xffed1c24), //50%
      500: Color(0xffed1c24), //60%
      600: Color(0xffed1c24), //70%
      700: Color(0xffed1c24), //80%
      800: Color(0xffed1c24), //90%
      900: Color(0xffed1c24), //100%
    },
  );
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
