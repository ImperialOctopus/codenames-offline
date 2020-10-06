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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'codenames',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: OutlinedButton(
                  child: Text('new game'),
                  onPressed: () {
                    BlocProvider.of<GameBloc>(context).add(GameEventNew());
                    Navigator.of(context).pushNamed('/play');
                  }),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: OutlinedButton(
                  child: Text(
                    'spymaster',
                  ),
                  onPressed: () => Navigator.of(context).pushNamed('/import')),
            ),
          ],
        ),
      ),
    );
  }
}
