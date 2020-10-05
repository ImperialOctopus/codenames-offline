import 'package:codenames/model/code_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/game/game_bloc.dart';
import '../bloc/game/game_state.dart';

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
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Card(
                child: InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: Text("Back"))),
          ],
        ),
        Row(children: state.cards.take(5).map(_cardBuilder).toList()),
        Row(children: state.cards.skip(5).take(5).map(_cardBuilder).toList()),
        Row(children: state.cards.skip(10).take(5).map(_cardBuilder).toList()),
        Row(children: state.cards.skip(15).take(5).map(_cardBuilder).toList()),
        Row(children: state.cards.skip(20).take(5).map(_cardBuilder).toList()),
      ],
    );
  }

  Widget _cardBuilder(CodeCard card) {}
}
