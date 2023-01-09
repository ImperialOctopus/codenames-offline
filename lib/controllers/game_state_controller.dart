import 'package:codenames/services/new_game_service.dart';
import 'package:flutter/material.dart';

import '../models/board_state.dart';

class GameStateController extends ValueNotifier<BoardState?> {
  final NewGameService newGameService;

  GameStateController({BoardState? startingValue, required this.newGameService})
      : super(startingValue);

  void newGame() {
    final cardList = newGameService.generateCardList();
    value = BoardState(cardList);
  }

  void flipCard(int index) {
    if (value?.cards == null) return;
    final cards = value!.cards.toList();

    cards[index] = cards[index].copyWith(visible: !cards[index].visible);
    value = BoardState(cards);
  }
}
