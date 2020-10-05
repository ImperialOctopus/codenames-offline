import 'package:codenames/screen/export_screen.dart';
import 'package:codenames/screen/import_screen.dart';
import 'package:codenames/screen/play_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/page/page_bloc.dart';
import '../model/app_page.dart';
import 'menu_screen.dart';

/// Containing screen for app pages.
class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageBloc, AppPage>(
      builder: (context, activePage) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Codenames'),
          ),
          body: _buildBody(activePage),
        );
      },
    );
  }

  Widget _buildBody(AppPage page) {
    switch (page) {
      case AppPage.menu:
        return MenuScreen();
      case AppPage.import:
        return ImportScreen();
      case AppPage.export:
        return ExportScreen();
      case AppPage.play:
        return PlayScreen();
      default:
    }
  }
}
