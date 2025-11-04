part of 'achievements_overlay_bloc.dart';

abstract class AchievementsOverlayEvent extends Equatable {
  const AchievementsOverlayEvent();

  @override
  List<Object?> get props => [];
}

class ShowAchievementCongratsOverlayEvent extends AchievementsOverlayEvent {
  final Achievement achievement;

  const ShowAchievementCongratsOverlayEvent(this.achievement);

  @override
  List<Object?> get props => [achievement];
}

class HideAchievementsOverlayEvent extends AchievementsOverlayEvent {
  const HideAchievementsOverlayEvent();
}
