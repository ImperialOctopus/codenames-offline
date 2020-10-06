import 'package:flutter/material.dart';

final themeData = ThemeData(
  // Define the default brightness and colors.
  brightness: Brightness.light,
  primaryColor: Color.fromARGB(255, 110, 20, 69),
  accentColor: Color.fromARGB(255, 181, 51, 70),

  cursorColor: Color.fromARGB(255, 181, 51, 70),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      primary: Color.fromARGB(255, 181, 51, 70),
      textStyle: TextStyle(fontSize: 32),
      minimumSize: Size(200, 60),
    ),
  ),
);
