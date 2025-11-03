part of 'achievements_bloc.dart';

abstract class AchievementsState extends Equatable {
  const AchievementsState();

  @override
  List<Object?> get props => [];
}

class AchievementsInitial extends AchievementsState {
  const AchievementsInitial();
}

class AchievementsLoaded extends AchievementsState {
  final List<Achievement> achievements;

  const AchievementsLoaded(this.achievements);

  @override
  List<Object?> get props => [achievements];
}
