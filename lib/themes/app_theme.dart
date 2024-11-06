import 'package:flutter/material.dart';
import 'schemes/primary_color.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: PrimaryColorScheme.primary,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: PrimaryColorScheme.primary,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: PrimaryColorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: PrimaryColorScheme.primary,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
    ),
  );
}
