import 'package:flutter/material.dart';

import 'codenames_app.dart';
import 'service/new_game_service.dart';
import 'service/word_service.dart';

void main() {
  var wordService = WordService();
  var newGameService = NewGameService(wordService);
  runApp(CodenamesApp(
    newGameService: newGameService,
  ));
}
