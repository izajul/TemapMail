import 'package:flutter/material.dart';

final theme = ThemeData(
    // This is the theme of your application.
    //
    // Try running your application with "flutter run". You'll see the
    // application has a blue toolbar. Then, without quitting the app, try
    // changing the primarySwatch below to Colors.green and then invoke
    // "hot reload" (press "r" in the console where you ran "flutter run",
    // or simply save your changes to "hot reload" in a Flutter IDE).
    // Notice that the counter didn't reset back to zero; the application
    // is not restarted.
    fontFamily: "Georgia",
    brightness: Brightness.dark,
    primarySwatch: TempColors.primary,
    primaryColor: TempColors.primary,
    colorScheme:
        theme.colorScheme.copyWith(secondary: TempColors.primaryAccent),
    backgroundColor: Colors.white,
    textTheme: textTheme,
    shadowColor: TempColors.shadow,
    indicatorColor: TempColors.textDark);

const textTheme = TextTheme(
  headline3: TextStyle(
      fontSize: 36.0, fontWeight: FontWeight.w900, color: TempColors.textDark),
  headline4: TextStyle(
      fontSize: 28.0, fontWeight: FontWeight.w900, color: TempColors.textDark),
  headline5: TextStyle(
      fontSize: 22.0, fontWeight: FontWeight.w900, color: TempColors.textDark),
  headline6: TextStyle(
      fontSize: 18.0, fontWeight: FontWeight.w900, color: TempColors.textDark),
  bodyText1: TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w500, color: TempColors.textDark),
  bodyText2:
      TextStyle(fontSize: 14.0, fontFamily: 'Hind', color: TempColors.textDark),
  caption: TextStyle(fontSize: 12.0),
  subtitle1: TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: TempColors.textDark,
      fontStyle: FontStyle.italic),
  subtitle2: TextStyle(
      fontSize: 12.0, fontWeight: FontWeight.w500, color: TempColors.textDark),
  button: TextStyle(
      fontSize: 14.0, fontWeight: FontWeight.w800, color: TempColors.textDark),
);

class TempColors {
  static const _primary = 0xffFF4F6C;
  static const _primaryAccent = 0xff7129C8;
  static const _textDark = 0xff333343;
  static const _borderDark = 0xff3A3A3A;
  static const _shadow = 0xfff3f5fc;

  static const primary = MaterialColor(_primary, <int, Color>{
    50: Color(0xfffdc4cd),
    100: Color(0xfffaa1af),
    200: Color(0xfff8778b),
    300: Color(0xffee536c),
    400: Color(0xffe2415a),
    500: Color(0xffc42c44),
    600: Color(0xffb4243b),
    700: Color(0xffa31d33),
    800: Color(0xff93192c),
    900: Color(0xff820d20),
  });
  static const primaryAccent = MaterialColor(_primaryAccent, <int, Color>{
    50: Color(0xffc193f8),
    100: Color(0xffa467ee),
    200: Color(0xff924ae8),
    300: Color(0xff8a3de7),
    400: Color(0xff7129C8),
    500: Color(0xff611db3),
    600: Color(0xff5d1aad),
    700: Color(0xff5515a1),
    800: Color(0xff5212a1),
    900: Color(0xff4f0f9a),
  });
  static const textDark = MaterialColor(_textDark, <int, Color>{
    50: Color(0xff606074),
    100: Color(0xff59596d),
    200: Color(0xff4a4a5e),
    300: Color(0xff3e3e50),
    400: Color(0xff333343),
    500: Color(0xff2a2a39),
    600: Color(0xff22222f),
    700: Color(0xff1a1a24),
    800: Color(0xff15151d),
    900: Color(0xff0c0c11),
  });
  static const borderDark = MaterialColor(_borderDark, <int, Color>{
    50: Color(0xffa7a5a5),
    100: Color(0xff848484),
    200: Color(0xff666666),
    300: Color(0xff535353),
    400: Color(0xff3A3A3A),
    500: Color(0xff2f2f2f),
    600: Color(0xff282828),
    700: Color(0xff212121),
    800: Color(0xff1a1a1a),
    900: Color(0xff111111),
  });
  static const shadow = MaterialColor(_shadow, <int, Color>{
    50: Color(0xfff3f5fc),
    100: Color(0xfff3f5fc),
    200: Color(0xfff3f5fc),
    300: Color(0xfff3f5fc),
    400: Color(0xfff3f5fc),
    500: Color(0xfff3f5fc),
    600: Color(0xfff3f5fc),
    700: Color(0xfff3f5fc),
    800: Color(0xfff3f5fc),
    900: Color(0xfff3f5fc),
  });

  static const Color backgroundWhite = Color(0xFFFFFFFF);
}
