import 'package:flutter/material.dart';

class MyThemeData {
  static Color PrimaryColor = Color(0xffB7935F);
  static Color darkPrimaryColor = Color(0xffFACC1D);
  static Color darkaccentColor = Color(0xff141A2E);
  static ThemeData Lighttheme = ThemeData(
      primaryColor: PrimaryColor,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        color: Colors.white,
        elevation: 2,
      ),
      textTheme: TextTheme(
          subtitle1: TextStyle(
              color: PrimaryColor, fontWeight: FontWeight.w500, fontSize: 30),
          headline2: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          headline1: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30)),
      scaffoldBackgroundColor: Colors.white,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(color: Colors.black)));
  static ThemeData darkTheme = ThemeData(
      primaryColor: PrimaryColor,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        color: Colors.transparent,
        elevation: 0,
      ),
      textTheme: TextTheme(
          subtitle1: TextStyle(
              color: darkPrimaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 30),
          headline2: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          headline1: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30)),
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: darkaccentColor,
          selectedIconTheme: IconThemeData(color: darkPrimaryColor)));
}
