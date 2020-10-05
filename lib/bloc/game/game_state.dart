import 'package:equatable/equatable.dart';

import '../../model/card.dart';

class GameState extends Equatable {
  final List<Card> cards;

  const GameState._({
    this.cards,
  });

  const GameState.unknown() : this._();

  const GameState.playing(List<Card> cards) : this._(cards: cards);

  @override
  List<Object> get props => [cards];
}
