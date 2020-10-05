import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/game/game_bloc.dart';
import 'screen/export_screen.dart';
import 'screen/import_screen.dart';
import 'screen/menu_screen.dart';
import 'screen/play_screen.dart';
import 'service/new_game_service.dart';
import 'theme/theme.dart';

class CodenamesApp extends StatelessWidget {
  const CodenamesApp({
    @required this.newGameService,
  }) : assert(newGameService != null);

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
      theme: themeData,
      navigatorKey: _navigatorKey,
      home: MenuScreen(),
      routes: <String, WidgetBuilder>{
        '/play': (var context) => PlayScreen(),
        '/import': (var context) => ImportScreen(),
        '/export': (var context) => ExportScreen(),
      },
    );
  }
}
