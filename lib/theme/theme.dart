import 'package:flutter/material.dart';

final defaultTheme = ThemeData.light();

final themeData = defaultTheme.copyWith(
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      textStyle: TextStyle(fontSize: 32),
      minimumSize: Size(200, 60),
    ),
  ),
);
