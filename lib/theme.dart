import 'package:flutter/material.dart';

abstract class SilverAppColors {
  static const yellow = Color(0xFFFEEB70);
  static const giratina100 = Color(0xFFF5F5F5);
  static const giratina400 = Color(0xFFBDBDBD);
  static const giratina500 = Color(0xFF9E9E9E);
}

abstract class SilverAppTheme {
  static final ThemeData light = ThemeData(
    primaryColor: SilverAppColors.yellow,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Color(0xFFFEFEFE),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 48,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 32,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      ),
    ),
  );
}
