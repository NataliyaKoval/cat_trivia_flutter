import 'package:flutter/material.dart';

class AppTheme {
  ThemeData lightTheme = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        minimumSize: const Size(double.infinity, 50),
        textStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
        elevation: 10
      ),
    ),
  );
}