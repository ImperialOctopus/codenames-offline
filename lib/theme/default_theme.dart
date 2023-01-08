import 'package:codenames/theme/app_theme.dart';
import 'package:flutter/material.dart';

final defaultTheme = AppTheme(
  themeData: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromARGB(255, 110, 20, 69),
      secondary: const Color.fromARGB(255, 181, 51, 70),
    ),
    textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Color.fromARGB(255, 181, 51, 70)),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color.fromARGB(255, 181, 51, 70),
        textStyle: const TextStyle(fontSize: 32),
        minimumSize: const Size(200, 60),
      ),
    ),
    //fontFamily: 'Georgia',
    useMaterial3: true,
  ),
  cardColor: const Color.fromARGB(255, 245, 230, 200),
  neutralColor: const Color.fromARGB(255, 245, 230, 200),
  redColor: Colors.red.shade400,
  blueColor: Colors.blue.shade400,
  assassinColor: Colors.black,
  iconColor: const Color.fromARGB(100, 0, 0, 0),
  iconColorLight: Colors.white,
  backButtonColor: const Color.fromARGB(255, 181, 51, 70),
);
