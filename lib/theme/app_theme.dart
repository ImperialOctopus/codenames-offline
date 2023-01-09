import 'package:codenames/models/card_affiliation.dart';
import 'package:flutter/material.dart';

class AppTheme {
  final ThemeData themeData;
  final Color backButtonColor;

  final Color cardColor;
  final Color alignmentNotchColor;
  final Color neutralColor;
  final Color redColor;
  final Color blueColor;
  final Color assassinColor;

  final Color iconColor;
  final Color iconColorLight;

  const AppTheme({
    required this.themeData,
    required this.backButtonColor,
    required this.cardColor,
    required this.alignmentNotchColor,
    required this.neutralColor,
    required this.redColor,
    required this.blueColor,
    required this.assassinColor,
    required this.iconColor,
    required this.iconColorLight,
  });

  Color affiliationToColor(CardAffiliation affiliation) {
    switch (affiliation) {
      case CardAffiliation.neutral:
        return neutralColor;
      case CardAffiliation.red:
        return redColor;
      case CardAffiliation.blue:
        return blueColor;
      case CardAffiliation.assassin:
        return assassinColor;
    }
  }
}
