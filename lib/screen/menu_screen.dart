import 'package:codenames/controllers/game_state_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'codenames',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Consumer<GameStateController>(
                builder: (context, gameStateController, _) => OutlinedButton(
                  onPressed: gameStateController.value == null
                      ? null
                      : () => Navigator.of(context).pushNamed('/play'),
                  child: const Text('continue'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: OutlinedButton(
                  child: Text('new game'),
                  onPressed: () {
                    Provider.of<GameStateController>(context).newGame();
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
