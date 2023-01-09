import 'package:auto_route/auto_route.dart';
import 'package:codenames/controllers/game_state_controller.dart';
import 'package:codenames/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

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
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Consumer<GameStateController>(
                builder: (context, gameStateController, _) => OutlinedButton(
                  onPressed: gameStateController.value == null
                      ? null
                      : () => context.router.push(const PlayRoute()),
                  child: const Text('continue'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: OutlinedButton(
                  child: const Text('new game'),
                  onPressed: () {
                    Provider.of<GameStateController>(context, listen: false)
                        .newGame();
                    context.router.push(const PlayRoute());
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: OutlinedButton(
                  child: const Text(
                    'spymaster',
                  ),
                  onPressed: () => context.router.push(const ImportRoute())),
            ),
          ],
        ),
      ),
    );
  }
}
