import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'router.dart';
import 'services/new_game_service.dart';
import 'services/secret_code_service.dart';

import 'config.dart' as config;
import 'services/word_service.dart';

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
        Provider<NewGameService>(
          create: (_) => NewGameService(
            wordService: WordService(),
          ),
        ),
        Provider<SecretCodeService>(
          create: (_) => SecretCodeService(),
        )
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
