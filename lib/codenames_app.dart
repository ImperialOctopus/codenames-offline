import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/game/game_bloc.dart';
import 'screen/menu_screen.dart';
import 'service/new_game_service.dart';

class CodenamesApp extends StatelessWidget {
  const CodenamesApp({
    @required this.newGameService,
  });

  final NewGameService newGameService;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<NewGameService>.value(
      value: newGameService,
      child: BlocProvider<GameBloc>(
        create: (_) => GameBloc(
          newGameService: newGameService,
        ),
        child: AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      home: MenuScreen(),
    );
  }
}
