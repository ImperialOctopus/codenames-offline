import 'package:flutter/material.dart';

import 'card_affiliation.dart';

@immutable
class CodeCard {
  final CardAffiliation affiliation;
  final String word;
  final bool visible;

  const CodeCard({
    required this.word,
    required this.affiliation,
    required this.visible,
  });

  CodeCard copyWith({
    CardAffiliation? affiliation,
    String? word,
    bool? visible,
  }) =>
      CodeCard(
        affiliation: affiliation ?? this.affiliation,
        word: word ?? this.word,
        visible: visible ?? this.visible,
      );
}
