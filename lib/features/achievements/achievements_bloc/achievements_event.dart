part of 'achievements_bloc.dart';

abstract class AchievementsEvent extends Equatable {
  const AchievementsEvent();

  @override
  List<Object?> get props => [];
}

class LoadAchievementsEvent extends AchievementsEvent {
  const LoadAchievementsEvent();
}

class RefreshAchievementsEvent extends AchievementsEvent {
  const RefreshAchievementsEvent();
}
