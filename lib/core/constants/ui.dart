import 'package:flutter/material.dart';

class MyColors {
  MyColors._();

  static const transparent = Colors.transparent;
  static const mainColor = Color(0xff48c0a2);
  static const myBlue = Color(0xff4c6ef6);
  static const black = Colors.black;
  static const green = Colors.green;
  static const red = Colors.red;

  static const white = Colors.white;
  static const white1 = Color(0xffeaeaea);
  static const brownGrey = Color.fromRGBO(141, 141, 141, 1);
  static const darkGrey = Color(0xff424242);
  static const grey = Color(0xff808080);
  static const lightGrey = Colors.grey;
  static const sonicSilver = Color(0xff767676);
  static const oceanGreen = Color(0xff48c0a2);
  static const brightYellow = Color(0xffffae2c);
  static const begonia = Color(0xfff86f6f);
  static const blueAccent = Colors.blueAccent;

  static const materialColor = {
    50: Color.fromRGBO(77, 111, 255, .1),
    100: Color.fromRGBO(77, 111, 255, .2),
    200: Color.fromRGBO(77, 111, 255, .3),
    300: Color.fromRGBO(77, 111, 255, .4),
    400: Color.fromRGBO(77, 111, 255, .5),
    500: Color.fromRGBO(77, 111, 255, .6),
    600: Color.fromRGBO(77, 111, 255, .7),
    700: Color.fromRGBO(77, 111, 255, .8),
    800: Color.fromRGBO(77, 111, 255, .9),
    900: Color.fromRGBO(77, 111, 255, 1),
  };
}

class MyTextTheme {
  MyTextTheme._();

  static const boldWhite24 = TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: MyColors.white);
  static const boldWhite16 = TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: MyColors.white);
  static const black25W700 = TextStyle(color: MyColors.black, fontWeight: FontWeight.w700, fontSize: 25);
  static const black17W700 = TextStyle(color: MyColors.black, fontWeight: FontWeight.w700, fontSize: 17);
  static const black25W300 = TextStyle(color: MyColors.black, fontWeight: FontWeight.w300, fontSize: 25);
  static const black17W300 = TextStyle(color: MyColors.black, fontWeight: FontWeight.w300, fontSize: 17);
  static const white25 = TextStyle(fontSize: 25, color: MyColors.white);
  static const white20 = TextStyle(fontSize: 20, color: MyColors.white);
  static const white16 = TextStyle(fontSize: 16, color: MyColors.white);
  static const white12 = TextStyle(fontSize: 12, color: MyColors.white);
  static const boldDarkGray12 = TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: MyColors.darkGrey);
  static const boldDarkGray18 = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: MyColors.darkGrey);
  static const boldDarkGray30 = TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: MyColors.darkGrey);
  static const boldDarkGray24 = TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: MyColors.darkGrey);
  static const w800MainColor15 = TextStyle(fontSize: 15, color: MyColors.mainColor, fontWeight: FontWeight.w800);
  static const lightGrey14 = TextStyle(fontSize: 14, color: MyColors.grey);
  static const lightGrey12 = TextStyle(fontSize: 12, color: MyColors.grey);
  static const w300DarkGrey14 = TextStyle(color: MyColors.darkGrey, fontSize: 14, fontWeight: FontWeight.w300);
  static const w500DarkGrey14 = TextStyle(color: MyColors.darkGrey, fontSize: 14, fontWeight: FontWeight.w500);
  static const w800MainColor22 = TextStyle(fontSize: 22, color: MyColors.mainColor, fontWeight: FontWeight.w800);
  static const lightGrey20 = TextStyle(fontSize: 20, color: MyColors.grey);
  static const lightGrey22 = TextStyle(color: MyColors.lightGrey, fontSize: 22);
  static const darkGrey12 = TextStyle(color: MyColors.darkGrey, fontSize: 15);
  static const darkGreyBold17 = TextStyle(color: MyColors.darkGrey, fontWeight: FontWeight.bold, fontSize: 15);
  static const darkGreyBold15 = TextStyle(color: MyColors.darkGrey, fontWeight: FontWeight.bold, fontSize: 15);
  static const darkGreyBold13 = TextStyle(color: MyColors.darkGrey, fontWeight: FontWeight.bold, fontSize: 13);
  static const darkGreyBold22 = TextStyle(color: MyColors.darkGrey, fontWeight: FontWeight.bold, fontSize: 22);
  static const darkGreyBold25 = TextStyle(color: MyColors.darkGrey, fontWeight: FontWeight.bold, fontSize: 25);
  static const darkGreyBold30 = TextStyle(color: MyColors.darkGrey, fontWeight: FontWeight.bold, fontSize: 30);
  static const darkGrey25W300 = TextStyle(color: MyColors.darkGrey, fontWeight: FontWeight.w300, fontSize: 25);
  static const darkGreyW30012 = TextStyle(fontSize: 12, color: MyColors.darkGrey, fontWeight: FontWeight.w300);
  static const darkGreyW40015 = TextStyle(fontSize: 15, color: MyColors.darkGrey, fontWeight: FontWeight.w400);
  static const darkGreyW50017 =TextStyle(color: Color(0xff424242), fontSize: 17, fontWeight: FontWeight.w500);
  static const darkGreyW50022 =TextStyle(color: Color(0xff424242), fontSize: 22, fontWeight: FontWeight.w500);
  static const darkGreyW50025 =TextStyle(color: Color(0xff424242), fontSize: 25, fontWeight: FontWeight.w500);
  static const darkGreyW50030 =TextStyle(color: Color(0xff424242), fontSize: 30, fontWeight: FontWeight.w500);
  static const darkGreyW40020 = TextStyle(fontSize: 20, color: MyColors.darkGrey, fontWeight: FontWeight.w400);
  static const darkGreyW40023 = TextStyle(fontSize: 23, color: MyColors.darkGrey, fontWeight: FontWeight.w400);
  static const darkGreyW40030 = TextStyle(fontSize: 30, color: MyColors.darkGrey, fontWeight: FontWeight.w400);
  static const darkGreyW70015 = TextStyle(fontSize: 15, color: MyColors.darkGrey, fontWeight: FontWeight.w700);
  static const darkGreyW70020 = TextStyle(fontSize: 20, color: MyColors.darkGrey, fontWeight: FontWeight.w700);
  static const darkGreyW70025 = TextStyle(fontSize: 25, color: MyColors.darkGrey, fontWeight: FontWeight.w700);
  static const darkGreyW80013 = TextStyle(fontSize: 13, color: MyColors.darkGrey, fontWeight: FontWeight.w800);
  static const myBlue12W500 = TextStyle(color: MyColors.myBlue, fontSize: 12, fontWeight: FontWeight.w500);
  static const myBlue15W500 = TextStyle(color: MyColors.myBlue, fontSize: 15, fontWeight: FontWeight.w500);
  static const myBlue22W500 = TextStyle(color: MyColors.myBlue, fontSize: 22, fontWeight: FontWeight.w500);
}

class MyTheme {
  MyTheme._();

  static ThemeData lightAbomis = ThemeData(
    fontFamily: "OpenSans",
    primaryColor: MyColors.white,
    canvasColor: Colors.transparent,
    brightness: Brightness.light,
    disabledColor: MyColors.brownGrey,
    scaffoldBackgroundColor: MyColors.white,

    timePickerTheme: const TimePickerThemeData(),

    // fontFamily: "OpenSans",
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: MyColors.darkGrey),
      headline2: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: MyColors.darkGrey),
      headline3: TextStyle(fontSize: 20, color: MyColors.darkGrey),
      headline4: TextStyle(
        fontSize: 18,
        color: MyColors.darkGrey,
      ),
      headline5: TextStyle(fontSize: 16, color: MyColors.darkGrey),
      headline6: TextStyle(fontSize: 14, color: MyColors.darkGrey),
      subtitle1: TextStyle(fontSize: 12, color: MyColors.darkGrey),
      subtitle2: TextStyle(fontSize: 10, color: MyColors.darkGrey),

      // bodyLarge: const TextStyle(fontSize: 14, color: Colors.black),
      // bodyMedium: const TextStyle(fontSize: 12, color: Colors.black),
      // bodySmall: const TextStyle(fontSize: 10, color: Colors.black),
    ),
  );

  // static ThemeData light = ThemeData.light().copyWith(
  //     primaryColor: MyColors.white,
  //     accentColor: MyColors.white,
  //     textButtonTheme: TextButtonThemeData(
  //         style: TextButton.styleFrom(
  //       primary: Colors.deepPurple,
  //     )));

  static ThemeData dark = ThemeData.dark().copyWith(
    primaryColor: Colors.deepPurple,
    accentColor: Colors.grey,
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
      primary: Colors.deepOrange,
    )),
  );
}

class MenuIcons {
  MenuIcons._();

  static const _kFontFam = 'icomoon';
  static const String? _kFontPkg = null;

  static const IconData iconEvent = IconData(0xe934, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData iconRight = IconData(0xe915, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData iconLeft = IconData(0xe914, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData iconAccount = IconData(0xe908, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData iconInfo = IconData(0xe92d, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData iconPassport = IconData(0xe928, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData iconVisa = IconData(0xe922, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData star = IconData(0xe940, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData iconSeat = IconData(0xe924, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData iconCard = IconData(0xe93b, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData iconTask = IconData(0xe91e, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData iconEdit = IconData(0xe907, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData iconCalendar = IconData(0xe90a, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData iconLeftArrow = IconData(0xe90e, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData iconRightArrow = IconData(0xe910, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData iconDownLoad = IconData(0xe946, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData iconPrint = IconData(0xe906, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData iconAdd = IconData(0xe909, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}
