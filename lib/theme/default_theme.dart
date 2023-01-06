import 'package:codenames/theme/theme.dart';
import 'package:flutter/material.dart';

const defaultTheme = AppTheme(
  themeData: ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.light,
    primaryColor: Color.fromARGB(255, 110, 20, 69),
    accentColor: Color.fromARGB(255, 181, 51, 70),

    textSelectionTheme:
        TextSelectionThemeData(cursorColor: Color.fromARGB(255, 181, 51, 70)),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: Color.fromARGB(255, 181, 51, 70),
        textStyle: TextStyle(fontSize: 32),
        minimumSize: Size(200, 60),
      ),
    ),
  ),
  cardColor: Color.fromARGB(255, 245, 230, 200),
  neutralColor: Color.fromARGB(255, 245, 230, 200),
  redColor: Colors.red.shade400,
  blueColor: Colors.blue.shade400,
  assassinColor: Colors.black,
  iconColor: Color.fromARGB(100, 0, 0, 0),
  iconColorLight: Colors.white,
  backButtonColor: Color.fromARGB(255, 181, 51, 70),
);
