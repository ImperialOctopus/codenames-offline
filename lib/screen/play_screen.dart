import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../bloc/game/game_bloc.dart';
import '../bloc/game/game_event.dart';
import '../bloc/game/game_state.dart';
import '../model/card_affiliation.dart';
import '../model/code_card.dart';

class PlayScreen extends StatelessWidget {
  static const cardColor = Color.fromARGB(255, 245, 230, 200);
  static const neutralColor = cardColor;
  static const redColor = Colors.red;
  static const blueColor = Colors.blue;
  static const assassinColor = Colors.black;
  static const iconColor = Color.fromARGB(100, 0, 0, 0);
  static const backButtonColor = Color.fromARGB(255, 181, 51, 70);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GameBloc, GameState>(
          bloc: BlocProvider.of<GameBloc>(context),
          builder: (var context, state) {
            if (state is GameStateEmpty) {
              return _buildEmpty(context);
            } else if (state is GameStatePlaying) {
              return _buildPlaying(context, state);
            } else {
              throw FallThroughError();
            }
          }),
    );
  }

  Widget _buildEmpty(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'no game data found',
          style: Theme.of(context).textTheme.headline4,
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: OutlinedButton(
              child: Text('back'),
              onPressed: () => Navigator.of(context).pop()),
        ),
      ],
    ));
  }

  Widget _buildPlaying(BuildContext context, GameStatePlaying state) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(5),
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 80,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(child: _buildBackButton(context)),
                    Expanded(flex: 3, child: _buildScoreBar(context, state)),
                    Expanded(child: _buildCodeButton(context)),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: state.cards
                      .take(5)
                      .map((card) => _cardBuilder(context, state, card))
                      .toList(),
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: state.cards
                      .skip(5)
                      .take(5)
                      .map((card) => _cardBuilder(context, state, card))
                      .toList(),
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: state.cards
                      .skip(10)
                      .take(5)
                      .map((card) => _cardBuilder(context, state, card))
                      .toList(),
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: state.cards
                      .skip(15)
                      .take(5)
                      .map((card) => _cardBuilder(context, state, card))
                      .toList(),
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: state.cards
                      .skip(20)
                      .take(5)
                      .map((card) => _cardBuilder(context, state, card))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardBuilder(
      BuildContext context, GameStatePlaying state, CodeCard card) {
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
                          FaIcon(FontAwesomeIcons.skull, color: Colors.white),
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
        widthFactor: 0.8,
        heightFactor: 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.bottomRight,
                child: RotatedBox(
                  quarterTurns: 2,
                  child: Text(
                    card.word.toLowerCase(),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.white),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.center,
                child: Text(
                  card.word.toLowerCase(),
                  style: Theme.of(context).textTheme.headline4,
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
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: Colors.white),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.center,
              child: Text(
                card.word.toLowerCase(),
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Card(
      color: backButtonColor,
      child: InkWell(
        onTap: () => Navigator.of(context).pop(),
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'back',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScoreBar(BuildContext context, GameStatePlaying state) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Spacer(flex: 1),
        Expanded(
            child: Card(
          color: cardColor,
          child: Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'red: ${state.redCardsLeft}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
        )),
        Expanded(
            child: Card(
          color: cardColor,
          child: Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'blue: ${state.blueCardsLeft}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
        )),
      ],
    );
  }

  Widget _buildCodeButton(BuildContext context) {
    return Card(
      color: cardColor,
      child: InkWell(
        onTap: () => Navigator.of(context).pushNamed('/export'),
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              'view code',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        ),
      ),
    );
  }
}
