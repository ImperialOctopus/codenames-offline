import 'package:equatable/equatable.dart';

import '../../model/card_affiliation.dart';
import '../../model/code_card.dart';

abstract class GameState extends Equatable {
  const GameState();

  @override
  List<Object> get props => [];
}

class GameStateEmpty extends GameState {}

class GameStatePlaying extends GameState {
  final List<CodeCard> cards;

  const GameStatePlaying(this.cards);

  @override
  List<Object> get props => [cards];

  int get redCardsLeft => cards
      .where((card) => !card.visible && card.affiliation == CardAffiliation.red)
      .length;

  int get blueCardsLeft => cards
      .where(
          (card) => !card.visible && card.affiliation == CardAffiliation.blue)
      .length;
}
