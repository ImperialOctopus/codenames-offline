import 'package:codenames/models/board_state.dart';
import 'package:flutter/widgets.dart';

import 'card_component.dart';

class CardBoard extends StatelessWidget {
  final BoardState boardState;
  final void Function(int) onCardTapped;

  const CardBoard({
    super.key,
    required this.boardState,
    required this.onCardTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var row = 0; row < 5; row++)
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (var col = 0; col < 5; col++)
                  CardComponent(
                    card: boardState.cards[row * 5 + col],
                    onTap: () => onCardTapped(row * 5 + col),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}
