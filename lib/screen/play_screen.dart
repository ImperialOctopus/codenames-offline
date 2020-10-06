import 'package:codenames/model/card_affiliation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/game/game_bloc.dart';
import '../bloc/game/game_state.dart';
import '../model/code_card.dart';

class PlayScreen extends StatelessWidget {
  static const cardColor = Color.fromARGB(255, 245, 230, 200);
  static const backButtonColor = Color.fromARGB(255, 240, 30, 30);

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
        Text('No game data found'),
        RaisedButton(
            child: Text('Back'), onPressed: () => Navigator.of(context).pop()),
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
                      .map((card) => _cardBuilder(context, card))
                      .toList(),
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: state.cards
                      .skip(5)
                      .take(5)
                      .map((card) => _cardBuilder(context, card))
                      .toList(),
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: state.cards
                      .skip(10)
                      .take(5)
                      .map((card) => _cardBuilder(context, card))
                      .toList(),
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: state.cards
                      .skip(15)
                      .take(5)
                      .map((card) => _cardBuilder(context, card))
                      .toList(),
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: state.cards
                      .skip(20)
                      .take(5)
                      .map((card) => _cardBuilder(context, card))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardBuilder(BuildContext context, CodeCard card) {
    return Expanded(
      child: Card(
        color: cardColor,
        child: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          card.word.toLowerCase(),
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    ),
                    Expanded(
                      child: RotatedBox(
                        quarterTurns: 2,
                        child: Text(
                          card.word.toLowerCase(),
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Card(
      color: backButtonColor,
      child: InkWell(
        onTap: () => Navigator.of(context).pop(),
        child: Center(
          child: Text(
            'back',
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: Colors.white),
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
            child: Text(
              'red: ${state.redCardsLeft}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
        )),
        Expanded(
            child: Card(
          color: cardColor,
          child: Center(
            child: Text(
              'blue: ${state.blueCardsLeft}',
              style: Theme.of(context).textTheme.headline4,
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
          child: Text(
            'view code',
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    );
  }
}
