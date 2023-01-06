import 'package:codenames/controllers/game_state_controller.dart';
import 'package:codenames/screen/play_screen/card_board.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../models/card_affiliation.dart';
import '../../models/code_card.dart';

class PlayScreen extends StatelessWidget {
  static const Color cardColor = Color.fromARGB(255, 245, 230, 200);
  static const Color neutralColor = cardColor;
  static final Color redColor = Colors.red.shade400;
  static final Color blueColor = Colors.blue.shade400;
  static const Color assassinColor = Colors.black;

  static const Color iconColor = Color.fromARGB(100, 0, 0, 0);
  static const Color iconColorLight = Colors.white;

  static const Color backButtonColor = Color.fromARGB(255, 181, 51, 70);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(5),
        child: Consumer<GameStateController>(
          builder: (context, gameStateController, _) =>
              (gameStateController.value == null)
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'no game data found',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: OutlinedButton(
                              child: Text('back'),
                              onPressed: () => Navigator.of(context).pop()),
                        ),
                      ],
                    )
                  : AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            height: 80,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: Card(
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
                                          color: cardColor,
                                          child: Center(
                                            child: FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: Text(
                                                'red: ${state.redCardsLeft}',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline4,
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
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline4,
                                              ),
                                            ),
                                          ),
                                        )),
                                      ],
                                    )),
                                Expanded(
                                    child: Card(
                                  color: cardColor,
                                  child: InkWell(
                                    onTap: () => Navigator.of(context)
                                        .pushNamed('/export'),
                                    child: Center(
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text(
                                          'view code',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                              ],
                            ),
                          ),
                          Expanded(
                              child: CardBoard(
                            cards: [],
                          )),
                        ],
                      ),
                    ),
        ),
      ),
    );
  }
}
