import 'package:meta/meta.dart';

import 'card_affiliation.dart';

class Card {
  final CardAffiliation affiliation;
  final bool visible;
  final String word;

  const Card(
      {@required this.word,
      @required this.affiliation,
      @required this.visible});

  Card copyWith({CardAffiliation affiliation, bool visible, String word}) =>
      Card(
          affiliation: affiliation ?? this.affiliation,
          visible: visible ?? this.visible,
          word: word ?? this.word);
}
