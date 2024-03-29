// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    MenuRoute.name: (routeData) {
      return MaterialPageX<void>(
        routeData: routeData,
        child: const MenuPage(),
      );
    },
    PlayRoute.name: (routeData) {
      return MaterialPageX<void>(
        routeData: routeData,
        child: const PlayPage(),
      );
    },
    ExportRoute.name: (routeData) {
      final args = routeData.argsAs<ExportRouteArgs>();
      return MaterialPageX<void>(
        routeData: routeData,
        child: ExportPage(
          key: args.key,
          boardState: args.boardState,
        ),
      );
    },
    ImportRoute.name: (routeData) {
      return MaterialPageX<void>(
        routeData: routeData,
        child: const ImportPage(),
      );
    },
    SpymasterRoute.name: (routeData) {
      final args = routeData.argsAs<SpymasterRouteArgs>();
      return MaterialPageX<void>(
        routeData: routeData,
        child: SpymasterPage(
          key: args.key,
          spymasterData: args.spymasterData,
        ),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          MenuRoute.name,
          path: '/',
        ),
        RouteConfig(
          PlayRoute.name,
          path: '/play',
        ),
        RouteConfig(
          ExportRoute.name,
          path: '/export',
        ),
        RouteConfig(
          ImportRoute.name,
          path: '/import',
        ),
        RouteConfig(
          SpymasterRoute.name,
          path: '/spymaster',
        ),
      ];
}

/// generated route for
/// [MenuPage]
class MenuRoute extends PageRouteInfo<void> {
  const MenuRoute()
      : super(
          MenuRoute.name,
          path: '/',
        );

  static const String name = 'MenuRoute';
}

/// generated route for
/// [PlayPage]
class PlayRoute extends PageRouteInfo<void> {
  const PlayRoute()
      : super(
          PlayRoute.name,
          path: '/play',
        );

  static const String name = 'PlayRoute';
}

/// generated route for
/// [ExportPage]
class ExportRoute extends PageRouteInfo<ExportRouteArgs> {
  ExportRoute({
    Key? key,
    required BoardState boardState,
  }) : super(
          ExportRoute.name,
          path: '/export',
          args: ExportRouteArgs(
            key: key,
            boardState: boardState,
          ),
        );

  static const String name = 'ExportRoute';
}

class ExportRouteArgs {
  const ExportRouteArgs({
    this.key,
    required this.boardState,
  });

  final Key? key;

  final BoardState boardState;

  @override
  String toString() {
    return 'ExportRouteArgs{key: $key, boardState: $boardState}';
  }
}

/// generated route for
/// [ImportPage]
class ImportRoute extends PageRouteInfo<void> {
  const ImportRoute()
      : super(
          ImportRoute.name,
          path: '/import',
        );

  static const String name = 'ImportRoute';
}

/// generated route for
/// [SpymasterPage]
class SpymasterRoute extends PageRouteInfo<SpymasterRouteArgs> {
  SpymasterRoute({
    Key? key,
    required List<CardAffiliation> spymasterData,
  }) : super(
          SpymasterRoute.name,
          path: '/spymaster',
          args: SpymasterRouteArgs(
            key: key,
            spymasterData: spymasterData,
          ),
        );

  static const String name = 'SpymasterRoute';
}

class SpymasterRouteArgs {
  const SpymasterRouteArgs({
    this.key,
    required this.spymasterData,
  });

  final Key? key;

  final List<CardAffiliation> spymasterData;

  @override
  String toString() {
    return 'SpymasterRouteArgs{key: $key, spymasterData: $spymasterData}';
  }
}
