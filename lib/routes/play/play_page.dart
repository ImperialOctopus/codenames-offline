import 'package:auto_route/auto_route.dart';
import 'package:codenames/controllers/game_state_controller.dart';
import 'package:codenames/router.dart';
import 'package:codenames/routes/play/card_board.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme/app_theme.dart';
import 'card_component.dart';

class PlayPage extends StatelessWidget {
  const PlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<AppTheme>(context);
    final gameStateController = Provider.of<GameStateController>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(5),
        child: Center(
          child: gameStateController.value == null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'no game data found',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: OutlinedButton(
                          child: const Text('back'),
                          onPressed: () => context.router.pop()),
                    ),
                  ],
                )
              : AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 80,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: Card(
                                color: appTheme.backButtonColor,
                                child: InkWell(
                                  onTap: () => context.router.pop(),
                                  child: Center(
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        'back',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium
                                            ?.copyWith(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 3,
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    const Spacer(flex: 1),
                                    Expanded(
                                        child: Card(
                                      color: appTheme.cardColor,
                                      child: Center(
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            'red: ${gameStateController.value!.redCardsLeft}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium,
                                          ),
                                        ),
                                      ),
                                    )),
                                    Expanded(
                                        child: Card(
                                      color: appTheme.cardColor,
                                      child: Center(
                                        child: FittedBox(
                                          fit: BoxFit.scaleDown,
                                          child: Text(
                                            'blue: ${gameStateController.value!.blueCardsLeft}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineMedium,
                                          ),
                                        ),
                                      ),
                                    )),
                                  ],
                                )),
                            Expanded(
                                child: Card(
                              color: appTheme.cardColor,
                              child: InkWell(
                                onTap: () => context.router.push(ExportRoute(
                                    boardState: gameStateController.value!)),
                                child: Center(
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      'view code',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineMedium,
                                    ),
                                  ),
                                ),
                              ),
                            )),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            CardBoard(
                              boardState: gameStateController.value!,
                              onCardTapped: (int index) =>
                                  gameStateController.flipCard(index),
                            ),
                            Positioned(
                              left: 8,
                              bottom: 8,
                              child: IgnorePointer(
                                child: Container(
                                  width: 16,
                                  height: 16,
                                  decoration: BoxDecoration(
                                    color: appTheme.alignmentNotchColor,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
