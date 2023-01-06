import 'package:flutter/material.dart';

import '../models/board_state.dart';

class GameStateController extends ValueNotifier<BoardState?> {
  GameStateController(super.value);

  final List<CodeCard> cards;

  @override
  List<Object> get props => [cards];

  int get redCardsLeft => cards
      .where((card) => !card.visible && card.affiliation == CardAffiliation.red)
      .length;

  int get blueCardsLeft => cards
      .where(
          (card) => !card.visible && card.affiliation == CardAffiliation.blue)
      .length;

  void newGame() {
    var cardList = await _newGameService.generateCardList();
  }

  void flipBoard() {
    if (state is GameStatePlaying) {
      var cardList = (state as GameStatePlaying).cards.toList();
      var flipIndex = event.flipIndex;

      cardList[flipIndex] =
          cardList[flipIndex].copyWith(visible: !cardList[flipIndex].visible);

      yield GameStatePlaying(cardList);
    } else {
      throw StateError('Tried to flip card with an empty game state');
    }
  }
}
