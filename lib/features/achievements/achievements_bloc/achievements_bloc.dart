import 'dart:math';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/storage/local_storage_service.dart';
import '../model/achievement_model.dart';

part 'achievements_event.dart';

part 'achievements_state.dart';

class AchievementsBloc extends Bloc<AchievementsEvent, AchievementsState> {
  final LocalStorageService storage;

  AchievementsBloc(this.storage) : super(AchievementsInitial()) {
    on<LoadAchievementsEvent>(_onLoadAchievements);
    on<RefreshAchievementsEvent>(_onRefreshAchievements);
  }

  Future<void> _onLoadAchievements(
    LoadAchievementsEvent event,
    Emitter<AchievementsState> emit,
  ) async {
    await storage.ensureInitialized();

    final savedAchievements = storage.achievements;

    final updatedAchievements = await _calculateAchievements(savedAchievements);

    await storage.saveAchievements(updatedAchievements);

    emit(AchievementsLoaded(updatedAchievements));
  }

  Future<void> _onRefreshAchievements(
    RefreshAchievementsEvent event,
    Emitter<AchievementsState> emit,
  ) async {
    await storage.ensureInitialized();

    final savedAchievements = storage.achievements;
    final updatedAchievements = await _calculateAchievements(savedAchievements);

    await storage.saveAchievements(updatedAchievements);
    emit(AchievementsLoaded(updatedAchievements));
  }

  Future<List<Achievement>> _calculateAchievements(
    List<Achievement> previous,
  ) async {
    final stats = storage.exerciseStats;

    final totalReps = stats.values.fold<int>(0, (s, e) => s + e.exerciseReps);
    final totalTime = stats.values.fold<int>(0, (s, e) => s + e.exerciseTime);
    final distinctExercises = stats.keys.length;

    // todo: link to real WorkoutDayRecord data
    const consecutiveDays = 3;
    const workoutsToday = 2;

    double ratio(num value, num target) => min(1.0, value / target.toDouble());

    final all = <Achievement>[
      Achievement(
        title: "First step",
        description: "Performed 1 exercise of any type.",
        progress: ratio(totalReps, 1),
        iconType: AchievementIconType.cup,
      ),
      Achievement(
        title: "10 reps",
        description: "Did a total of 10 reps of any exercise.",
        progress: ratio(totalReps, 10),
        iconType: AchievementIconType.medal,
      ),
      Achievement(
        title: "Beginner",
        description: "Completed 3 different exercises.",
        progress: ratio(distinctExercises, 3),
        iconType: AchievementIconType.cup,
      ),
      Achievement(
        title: "Five-minute workout",
        description: "Practiced for at least 5 minutes.",
        progress: ratio(totalTime / 60, 5),
        iconType: AchievementIconType.medal,
      ),
      Achievement(
        title: "Loyal user",
        description: "Worked out 3 days in a row.",
        progress: ratio(consecutiveDays, 3),
        iconType: AchievementIconType.cup,
      ),
      Achievement(
        title: "Doubled growth",
        description: "Completed 2 workouts in one day.",
        progress: ratio(workoutsToday, 2),
        iconType: AchievementIconType.medal,
      ),
      Achievement(
        title: "Marathon runner",
        description: "Trained for at least 30 minutes.",
        progress: ratio(totalTime / 60, 30),
        iconType: AchievementIconType.cup,
      ),
      Achievement(
        title: "100 reps",
        description: "Did 100 reps in total.",
        progress: ratio(totalReps, 100),
        iconType: AchievementIconType.medal,
      ),
      Achievement(
        title: "Push-Up Guru",
        description: "Completed 50 Push-Ups in total.",
        progress: ratio(stats["Push-Ups"]?.exerciseReps ?? 0, 50),
        iconType: AchievementIconType.cup,
      ),
      Achievement(
        title: "Depay non-stop",
        description: "Did 30 Tricep Dips in one workout.",
        progress: ratio(stats["Tricep Dips"]?.exerciseReps ?? 0, 30),
        iconType: AchievementIconType.medal,
      ),
      Achievement(
        title: "Squat King",
        description: "Completed a total of 100 Squats.",
        progress: ratio(stats["Squats"]?.exerciseReps ?? 0, 100),
        iconType: AchievementIconType.cup,
      ),
      Achievement(
        title: "Lungeer of the Year",
        description: "Performed 40 Lunges in one workout.",
        progress: ratio(stats["Lunges"]?.exerciseReps ?? 0, 40),
        iconType: AchievementIconType.cup,
      ),
      Achievement(
        title: "Burpee Lightning",
        description: "Performed 20 Burpees in a row.",
        progress: ratio(stats["Burpees"]?.exerciseReps ?? 0, 20),
        iconType: AchievementIconType.medal,
      ),
      Achievement(
        title: "Jumper of the Year",
        description: "Completed 200 Jumping Jacks.",
        progress: ratio(stats["Jumping Jacks"]?.exerciseReps ?? 0, 200),
        iconType: AchievementIconType.cup,
      ),
      Achievement(
        title: "Crunches Champion",
        description: "Completed 60 Crunches in one workout.",
        progress: ratio(stats["Crunches"]?.exerciseReps ?? 0, 60),
        iconType: AchievementIconType.medal,
      ),
      Achievement(
        title: "Cyclist",
        description: "Completed 100 Bicycle Crunches.",
        progress: ratio(stats["Bicycle Crunches"]?.exerciseReps ?? 0, 100),
        iconType: AchievementIconType.medal,
      ),
      Achievement(
        title: "Lifter",
        description: "Did a total of 50 Leg Raises.",
        progress: ratio(stats["Leg Raises"]?.exerciseReps ?? 0, 50),
        iconType: AchievementIconType.cup,
      ),
      Achievement(
        title: "Daily Fighter",
        description: "Trained for at least 5 days in a row.",
        progress: ratio(consecutiveDays, 5),
        iconType: AchievementIconType.medal,
      ),
      Achievement(
        title: "Iron will",
        description: "Trained for 60 minutes in one day.",
        progress: ratio(totalTime / 60, 60),
        iconType: AchievementIconType.cup,
      ),
      Achievement(
        title: "Titled Athlete",
        description: "Completed 500 total repetitions.",
        progress: ratio(totalReps, 500),
        iconType: AchievementIconType.medal,
      ),
    ];

    final merged =
        all.map((current) {
          final old = previous.firstWhere(
            (a) => a.title == current.title,
            orElse: () => current,
          );
          final isCompleted = current.progress >= 1.0;
          return old.copyWith(
            progress: current.progress,
            isCompleted: isCompleted,
          );
        }).toList();

    return merged;
  }
}
