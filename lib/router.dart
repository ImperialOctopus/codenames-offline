import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'models/board_state.dart';
import 'routes/export_page.dart';
import 'routes/import_page.dart';
import 'routes/menu_page.dart';
import 'routes/play_screen/play_page.dart';
import 'routes/spymaster_page.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute<void>(path: '/', page: MenuPage, initial: true),
    AutoRoute<void>(path: '/play', page: PlayPage),
    AutoRoute<void>(path: '/export', page: ExportPage),
    AutoRoute<void>(path: '/import', page: ImportPage),
    AutoRoute<void>(path: '/spymaster', page: SpymasterPage),
  ],
)
class AppRouter extends _$AppRouter {}
