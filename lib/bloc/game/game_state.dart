import 'package:equatable/equatable.dart';

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
}
