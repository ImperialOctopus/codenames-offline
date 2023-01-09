import 'package:codenames/controllers/game_state_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'router.dart';
import 'services/new_game_service.dart';
import 'services/secret_code_service.dart';
import 'services/word_service.dart';
import 'theme/app_theme.dart';
import 'config.dart' as config;

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AppRouter router;

  @override
  void initState() {
    router = AppRouter();

    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<GameStateController>(
          create: (_) => GameStateController(
            newGameService: NewGameService(
              wordService: WordService(),
            ),
          ),
        ),
        Provider<SecretCodeService>(
          create: (_) => SecretCodeService(),
        ),
        Provider<AppTheme>.value(value: config.theme),
      ],
      child: MaterialApp.router(
        title: config.title,
        theme: config.theme.themeData,
        routerDelegate: router.delegate(),
        routeInformationParser: router.defaultRouteParser(),
      ),
    );
  }
}
