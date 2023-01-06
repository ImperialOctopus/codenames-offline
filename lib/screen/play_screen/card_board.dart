import 'package:flutter/material.dart';

import '../../models/code_card.dart';
import 'card_component.dart';

class CardBoard extends StatelessWidget {
  final List<CodeCard> cards;

  const CardBoard({super.key, required this.cards});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:
              cards.take(5).map((card) => CardComponent(card: card)).toList(),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: cards
              .skip(5)
              .take(5)
              .map((card) => CardComponent(card: card))
              .toList(),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: cards
              .skip(10)
              .take(5)
              .map((card) => CardComponent(card: card))
              .toList(),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: cards
              .skip(15)
              .take(5)
              .map((card) => CardComponent(card: card))
              .toList(),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: cards
              .skip(20)
              .take(5)
              .map((card) => CardComponent(card: card))
              .toList(),
        ),
      ],
    );
  }
}
