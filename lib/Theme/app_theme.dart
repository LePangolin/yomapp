import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color _lightPrimaryColor = Colors.red;
  static const Color _lightSecondaryColor = Color(0xFFFEF9EB);
  static const Color _lightAccentColor = Colors.red;
  static const Color _lightTextColor = Color(0xFF212121);

  static const Color _darkPrimaryColor = Color(0xFF121212);
  static const Color _darkSecondaryColor = Color(0xFF212121);
  static const Color _darkAccentColor = Color(0xFF303030);
  static const Color _darkTextColor = Color(0xFFFFFFFF);

  static final ThemeData lightTheme = ThemeData(
    primaryColor: _lightPrimaryColor,
    scaffoldBackgroundColor: _lightPrimaryColor,
    cardColor: _lightSecondaryColor,
    accentColor: _lightAccentColor,
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: _lightTextColor),
      bodyText2: TextStyle(color: _lightTextColor),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: _darkPrimaryColor,
    scaffoldBackgroundColor: _darkPrimaryColor,
    cardColor: _darkSecondaryColor,
    accentColor: _darkAccentColor,
    textTheme: const TextTheme(
      bodyText1: TextStyle(color: _darkTextColor),
      bodyText2: TextStyle(color: _darkTextColor),
    ),
  );
}