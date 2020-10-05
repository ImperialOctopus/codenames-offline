import 'package:codenames/service/new_game_service.dart';
import 'package:codenames/service/word_service.dart';
import 'package:flutter/material.dart';

import 'codenames_app.dart';

void main() {
  var wordService = WordService();
  var newGameService = NewGameService(wordService);
  runApp(CodenamesApp(
    newGameService: newGameService,
  ));
}
