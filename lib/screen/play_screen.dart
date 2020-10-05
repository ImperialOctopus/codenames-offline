import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/game/game_bloc.dart';
import '../bloc/game/game_state.dart';
import '../model/code_card.dart';

class PlayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Card(
                  child: InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Text("Back"))),
            ),
            Spacer(flex: 3),
            Expanded(
              child: Card(
                  child: InkWell(
                      onTap: () => Navigator.of(context).pushNamed('/export'),
                      child: Text("View Code"))),
            ),
          ],
        ),
        GridView.count(
          crossAxisCount: 5,
          padding: const EdgeInsets.all(1.5),
          mainAxisSpacing: 1.0,
          crossAxisSpacing: 1.0,
          shrinkWrap: true,
          children:
              state.cards.map((card) => _cardBuilder(context, card)).toList(),
        )
      ],
    );
  }

  Widget _cardBuilder(BuildContext context, CodeCard card) {
    return Card(
        child: InkWell(
            onTap: () => Navigator.of(context).pop(), child: Text(card.word)));
  }
}
