import '../../theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../models/card_affiliation.dart';
import '../../models/code_card.dart';

class CardComponent extends StatelessWidget {
  final CodeCard card;
  final void Function() onTap;

  const CardComponent({super.key, required this.card, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: !card.visible
            ? Provider.of<AppTheme>(context).cardColor
            : Provider.of<AppTheme>(context)
                .affiliationToColor(card.affiliation),
        child: InkWell(
          onTap: onTap,
          child: !card.visible
              ? LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth > 250) {
                      return _buildDoubleWord(context, card.word);
                    } else {
                      return _buildSingleWord(context, card.word);
                    }
                  },
                )
              : Padding(
                  padding: const EdgeInsets.all(10),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: FittedBox(
                      child: FaIcon(
                        _iconData(card.affiliation),
                        color: _iconColor(
                            card.affiliation, Provider.of<AppTheme>(context)),
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  IconData _iconData(CardAffiliation affiliation) {
    switch (affiliation) {
      case CardAffiliation.neutral:
        return Icons.close;
      case CardAffiliation.red:
      case CardAffiliation.blue:
        return FontAwesomeIcons.userSecret;
      case CardAffiliation.assassin:
        return FontAwesomeIcons.skull;
    }
  }

  Color _iconColor(CardAffiliation affiliation, AppTheme theme) {
    switch (affiliation) {
      case CardAffiliation.neutral:
      case CardAffiliation.red:
      case CardAffiliation.blue:
        return theme.iconColor;
      case CardAffiliation.assassin:
        return theme.iconColorLight;
    }
  }

  Widget _buildDoubleWord(BuildContext context, String word) {
    return FractionallySizedBox(
        heightFactor: 0.8,
        widthFactor: 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.center,
              child: RotatedBox(
                quarterTurns: 2,
                child: Text(
                  word.toLowerCase(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.white,
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.center,
                child: Text(
                  word.toLowerCase(),
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buildSingleWord(BuildContext context, String word) {
    return FractionallySizedBox(
      widthFactor: 0.8,
      heightFactor: 0.6,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.white,
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.center,
          child: Text(
            word.toLowerCase(),
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
      ),
    );
  }
}
