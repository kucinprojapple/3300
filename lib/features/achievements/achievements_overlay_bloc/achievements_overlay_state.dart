part of 'achievements_overlay_bloc.dart';

abstract class AchievementsOverlayState extends Equatable {
  const AchievementsOverlayState();

  @override
  List<Object?> get props => [];
}

class AchievementsOverlayInitial extends AchievementsOverlayState {
  const AchievementsOverlayInitial();
}

class AchievementsOverlayCongratsState extends AchievementsOverlayState {
  final String title;
  const AchievementsOverlayCongratsState(this.title);

  @override
  List<Object?> get props => [title];
}
