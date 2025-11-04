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
  final Achievement achievement;

  const AchievementsOverlayCongratsState(this.achievement);

  @override
  List<Object?> get props => [achievement];
}
