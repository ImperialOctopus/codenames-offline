import 'package:meta/meta.dart';

import 'card_affiliation.dart';

class CodeCard {
  final CardAffiliation affiliation;
  final bool visible;
  final String word;

  const CodeCard(
      {@required this.word,
      @required this.affiliation,
      @required this.visible});

  CodeCard copyWith({CardAffiliation affiliation, bool visible, String word}) =>
      CodeCard(
          affiliation: affiliation ?? this.affiliation,
          visible: visible ?? this.visible,
          word: word ?? this.word);
}
