// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [AchievementsScreen]
class AchievementsRoute extends PageRouteInfo<void> {
  const AchievementsRoute({List<PageRouteInfo>? children})
    : super(AchievementsRoute.name, initialChildren: children);

  static const String name = 'AchievementsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AchievementsScreen();
    },
  );
}

/// generated route for
/// [ExerciseDetailsScreen]
class ExerciseDetailsRoute extends PageRouteInfo<ExerciseDetailsRouteArgs> {
  ExerciseDetailsRoute({
    Key? key,
    required int index,
    List<PageRouteInfo>? children,
  }) : super(
         ExerciseDetailsRoute.name,
         args: ExerciseDetailsRouteArgs(key: key, index: index),
         initialChildren: children,
       );

  static const String name = 'ExerciseDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ExerciseDetailsRouteArgs>();
      return ExerciseDetailsScreen(key: args.key, index: args.index);
    },
  );
}

class ExerciseDetailsRouteArgs {
  const ExerciseDetailsRouteArgs({this.key, required this.index});

  final Key? key;

  final int index;

  @override
  String toString() {
    return 'ExerciseDetailsRouteArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [GameScreen]
class GameRoute extends PageRouteInfo<void> {
  const GameRoute({List<PageRouteInfo>? children})
    : super(GameRoute.name, initialChildren: children);

  static const String name = 'GameRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const GameScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [InfoScreen]
class InfoRoute extends PageRouteInfo<void> {
  const InfoRoute({List<PageRouteInfo>? children})
    : super(InfoRoute.name, initialChildren: children);

  static const String name = 'InfoRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const InfoScreen();
    },
  );
}

/// generated route for
/// [LoadingScreen]
class LoadingRoute extends PageRouteInfo<void> {
  const LoadingRoute({List<PageRouteInfo>? children})
    : super(LoadingRoute.name, initialChildren: children);

  static const String name = 'LoadingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoadingScreen();
    },
  );
}

/// generated route for
/// [MenuScreen]
class MenuRoute extends PageRouteInfo<void> {
  const MenuRoute({List<PageRouteInfo>? children})
    : super(MenuRoute.name, initialChildren: children);

  static const String name = 'MenuRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MenuScreen();
    },
  );
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
    : super(OnboardingRoute.name, initialChildren: children);

  static const String name = 'OnboardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnboardingScreen();
    },
  );
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileScreen();
    },
  );
}

/// generated route for
/// [RecordScreen]
class RecordRoute extends PageRouteInfo<RecordRouteArgs> {
  RecordRoute({
    Key? key,
    required int index,
    required int lastResult,
    required void Function(int) onSave,
    List<PageRouteInfo>? children,
  }) : super(
         RecordRoute.name,
         args: RecordRouteArgs(
           key: key,
           index: index,
           lastResult: lastResult,
           onSave: onSave,
         ),
         initialChildren: children,
       );

  static const String name = 'RecordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RecordRouteArgs>();
      return RecordScreen(
        key: args.key,
        index: args.index,
        lastResult: args.lastResult,
        onSave: args.onSave,
      );
    },
  );
}

class RecordRouteArgs {
  const RecordRouteArgs({
    this.key,
    required this.index,
    required this.lastResult,
    required this.onSave,
  });

  final Key? key;

  final int index;

  final int lastResult;

  final void Function(int) onSave;

  @override
  String toString() {
    return 'RecordRouteArgs{key: $key, index: $index, lastResult: $lastResult, onSave: $onSave}';
  }
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsScreen();
    },
  );
}
