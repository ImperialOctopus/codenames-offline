import 'package:codenames/models/card_affiliation.dart';
import 'package:codenames/routes/spymaster/affiliation_tile.dart';
import 'package:flutter/material.dart';

class AffiliationBoard extends StatelessWidget {
  final List<CardAffiliation> affiliations;

  const AffiliationBoard({super.key, required this.affiliations});

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
                  AffiliationTile(
                    affiliation: affiliations[row * 5 + col],
                  ),
              ],
            ),
          ),
      ],
    );
  }
}
