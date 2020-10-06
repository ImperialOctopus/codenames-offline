import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/game/game_bloc.dart';
import '../bloc/game/game_event.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Codenames',
              style: Theme.of(context).textTheme.headline3,
            ),
            RaisedButton(
                child: Text('New'),
                onPressed: () {
                  BlocProvider.of<GameBloc>(context).add(GameEventNew());
                  Navigator.of(context).pushNamed('/play');
                }),
            RaisedButton(
                child: Text('Import'),
                onPressed: () => Navigator.of(context).pushNamed('/import')),
          ],
        ),
      ),
    );
  }
}
