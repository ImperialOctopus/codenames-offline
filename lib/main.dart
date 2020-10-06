import 'package:flutter/material.dart';
import 'package:pwa/client.dart' as pwa;
import 'codenames_app.dart';
import 'service/new_game_service.dart';
import 'service/secret_code_service.dart';
import 'service/word_service.dart';

void main() async {
  pwa.Client();

  final wordService = WordService();
  final newGameService = NewGameService(wordService);
  final secretCodeService = SecretCodeService();

  runApp(CodenamesApp(
    newGameService: newGameService,
    secretCodeService: secretCodeService,
  ));
}
