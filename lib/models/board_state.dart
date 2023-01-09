import 'package:codenames/models/card_affiliation.dart';

import 'code_card.dart';

class BoardState {
  final List<CodeCard> cards;

  const BoardState(this.cards);

  int get redCardsLeft => cards
      .where((card) => !card.visible && card.affiliation == CardAffiliation.red)
      .length;

  int get blueCardsLeft => cards
      .where(
          (card) => !card.visible && card.affiliation == CardAffiliation.blue)
      .length;
}
