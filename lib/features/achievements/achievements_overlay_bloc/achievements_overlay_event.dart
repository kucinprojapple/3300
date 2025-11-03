part of 'achievements_overlay_bloc.dart';

abstract class AchievementsOverlayEvent extends Equatable {
  const AchievementsOverlayEvent();

  @override
  List<Object?> get props => [];
}

class ShowAchievementCongratsOverlayEvent extends AchievementsOverlayEvent {
  final String title;
  const ShowAchievementCongratsOverlayEvent(this.title);

  @override
  List<Object?> get props => [title];
}

class HideAchievementsOverlayEvent extends AchievementsOverlayEvent {
  const HideAchievementsOverlayEvent();
}
