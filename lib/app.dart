import 'package:flutter/material.dart';

import 'router/router.dart';
import 'routes/export_page.dart';
import 'routes/import_page.dart';
import 'routes/menu_page.dart';
import 'routes/play_screen/play_page.dart';
import 'routes/spymaster_page.dart';
import 'service/new_game_service.dart';
import 'service/secret_code_service.dart';

import 'config.dart' as config;

class App extends StatefulWidget {
  final NewGameService newGameService;
  final SecretCodeService secretCodeService;

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
    return Provider<AudioService>(
      create: (_) => AudioplayersAudioService(),
      child: MaterialApp.router(
        title: 'Codenames Offline',
        theme: config.theme.themeData,
        navigatorKey: _navigatorKey,
        home: MenuScreen(),
        routerDelegate: router.delegate(),
        routeInformationParser: router.defaultRouteParser(),
      ),
    );
  }
}
