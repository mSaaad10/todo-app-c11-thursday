import 'package:flutter/material.dart';

class AppTheme {
  static const Color lightPrimaryColor = Color(0xFF5D9CEC);
  static const Color scaffoldBgColor = Color(0xFFDFECDB);
  static const Color greyColor = Color(0xFFC8C9CB);
  static final ThemeData lightTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: lightPrimaryColor,
        primary: lightPrimaryColor,
        onPrimary: Colors.white,
      ),
      useMaterial3: false,
      primaryColor: lightPrimaryColor,
      appBarTheme: AppBarTheme(
          backgroundColor: lightPrimaryColor,

          //centerTitle: true,
          titleTextStyle: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
      scaffoldBackgroundColor: scaffoldBgColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: lightPrimaryColor,
        unselectedItemColor: greyColor,
      ),
      cardTheme: CardTheme(
        color: Colors.white,
      ),
      textTheme: TextTheme(
          titleMedium: TextStyle(
              fontSize: 14,
              color: lightPrimaryColor,
              fontWeight: FontWeight.bold),
          titleSmall: TextStyle(
              fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black),
          labelMedium: TextStyle(
              fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(
              fontWeight: FontWeight.bold,
              color: lightPrimaryColor,
              fontSize: 18)));
}
