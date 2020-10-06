import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/game/game_bloc.dart';
import '../bloc/game/game_state.dart';
import '../service/secret_code_service.dart';

class ExportScreen extends StatelessWidget {
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
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('rabbit'),
        Text(RepositoryProvider.of<SecretCodeService>(context)
            .encode(state.cards.map((card) => card.affiliation).toList())),
      ],
    ));
  }
}
