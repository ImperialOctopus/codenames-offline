import 'package:flutter/material.dart';

import '../../models/card_affiliation.dart';
import '../../models/code_card.dart';

class CardComponent extends StatelessWidget {
  final CodeCard card;

  const CardComponent({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    if (card.visible) {
      switch (card.affiliation) {
        case CardAffiliation.neutral:
          return Expanded(
            child: Card(
              color: neutralColor,
              child: InkWell(
                onTap: () {
                  BlocProvider.of<GameBloc>(context)
                      .add(GameEventFlip(state.cards.indexOf(card)));
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child:
                        FittedBox(child: Icon(Icons.close, color: iconColor)),
                  ),
                ),
              ),
            ),
          );
        case CardAffiliation.red:
          return Expanded(
            child: Card(
              color: redColor,
              child: InkWell(
                onTap: () {
                  BlocProvider.of<GameBloc>(context)
                      .add(GameEventFlip(state.cards.indexOf(card)));
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: FittedBox(
                        child: FaIcon(FontAwesomeIcons.userSecret,
                            color: iconColor)),
                  ),
                ),
              ),
            ),
          );
        case CardAffiliation.blue:
          return Expanded(
            child: Card(
              color: blueColor,
              child: InkWell(
                onTap: () {
                  BlocProvider.of<GameBloc>(context)
                      .add(GameEventFlip(state.cards.indexOf(card)));
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: FittedBox(
                        child: FaIcon(FontAwesomeIcons.userSecret,
                            color: iconColor)),
                  ),
                ),
              ),
            ),
          );
        case CardAffiliation.assassin:
          return Expanded(
            child: Card(
              color: assassinColor,
              child: InkWell(
                onTap: () {
                  BlocProvider.of<GameBloc>(context)
                      .add(GameEventFlip(state.cards.indexOf(card)));
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: FittedBox(
                      child:
                          FaIcon(FontAwesomeIcons.skull, color: iconColorLight),
                    ),
                  ),
                ),
              ),
            ),
          );
        default:
          throw FallThroughError();
      }
    } else {
      return Expanded(
        child: Card(
          color: cardColor,
          child: InkWell(
            onTap: () {
              BlocProvider.of<GameBloc>(context)
                  .add(GameEventFlip(state.cards.indexOf(card)));
            },
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 250) {
                  return _buildDoubleCard(context, card);
                } else {
                  return _buildSingleCard(context, card);
                }
              },
            ),
          ),
        ),
      );
    }
  }

  Widget _buildDoubleCard(BuildContext context, CodeCard card) {
    return FractionallySizedBox(
        heightFactor: 0.8,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.center,
                child: RotatedBox(
                  quarterTurns: 2,
                  child: Text(
                    card.word.toLowerCase(),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FractionallySizedBox(
                widthFactor: 0.8,
                child: LimitedBox(
                  maxHeight: 100,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.white),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.center,
                      child: Text(
                        card.word.toLowerCase(),
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget _buildSingleCard(BuildContext context, CodeCard card) {
    return FractionallySizedBox(
      widthFactor: 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LimitedBox(
            maxHeight: 100,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.white),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.center,
                child: Text(
                  card.word.toLowerCase(),
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
