import 'dart:math';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app_core_design/assets.dart';
import '../../../app_core_design/texts.dart';
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

    String resolveIconPath(double progress) {
      progress = progress.clamp(0.0, 1.0);
      if (progress >= 1.0) return AppAssets.achievementCupWhite;
      if (progress >= 0.5) return AppAssets.achievementCupGold;
      final index = (progress / 0.05).floor() + 1;
      final safeIndex = index.clamp(1, 10);
      return 'assets/images/achievement_medal_$safeIndex.webp';
    }

    final all = <Achievement>[
      Achievement(
        title: AppTexts.achievementFirstStepTitle,
        description: AppTexts.achievementFirstStepDesc,
        progress: ratio(totalReps, 1),
        iconType: AchievementIconType.cup,
      ),
      Achievement(
        title: AppTexts.achievementTenReps,
        description: AppTexts.achievementTenRepsDesc,
        progress: ratio(totalReps, 10),
        iconType: AchievementIconType.medal,
      ),
      Achievement(
        title: AppTexts.achievementBeginner,
        description: AppTexts.achievementBeginnerDesc,
        progress: ratio(distinctExercises, 3),
        iconType: AchievementIconType.cup,
      ),
      Achievement(
        title: AppTexts.achievementFiveMinutes,
        description: AppTexts.achievementFiveMinutesDesc,
        progress: ratio(totalTime / 60, 5),
        iconType: AchievementIconType.medal,
      ),
      Achievement(
        title: AppTexts.achievementLoyalUser,
        description: AppTexts.achievementLoyalUserDesc,
        progress: ratio(consecutiveDays, 3),
        iconType: AchievementIconType.cup,
      ),
      Achievement(
        title: AppTexts.achievementDoubleGrowth,
        description: AppTexts.achievementDoubleGrowthDesc,
        progress: ratio(workoutsToday, 2),
        iconType: AchievementIconType.medal,
      ),
      Achievement(
        title: AppTexts.achievementMarathonRunner,
        description: AppTexts.achievementMarathonRunnerDesc,
        progress: ratio(totalTime / 60, 30),
        iconType: AchievementIconType.cup,
      ),
      Achievement(
        title: AppTexts.achievementHundredReps,
        description: AppTexts.achievementHundredRepsDesc,
        progress: ratio(totalReps, 100),
        iconType: AchievementIconType.medal,
      ),
      Achievement(
        title: AppTexts.achievementPushUpGuru,
        description: AppTexts.achievementPushUpGuruDesc,
        progress: ratio(stats[AppTexts.pushUps]?.exerciseReps ?? 0, 50),
        iconType: AchievementIconType.cup,
      ),
      Achievement(
        title: AppTexts.achievementDepay,
        description: AppTexts.achievementDepayDesc,
        progress: ratio(stats[AppTexts.tricepDips]?.exerciseReps ?? 0, 30),
        iconType: AchievementIconType.medal,
      ),
      Achievement(
        title: AppTexts.achievementSquatKing,
        description: AppTexts.achievementSquatKingDesc,
        progress: ratio(stats[AppTexts.squats]?.exerciseReps ?? 0, 100),
        iconType: AchievementIconType.cup,
      ),
      Achievement(
        title: AppTexts.achievementLungeer,
        description: AppTexts.achievementLungeerDesc,
        progress: ratio(stats[AppTexts.lunges]?.exerciseReps ?? 0, 40),
        iconType: AchievementIconType.cup,
      ),
      Achievement(
        title: AppTexts.achievementBurpeeLightning,
        description: AppTexts.achievementBurpeeLightningDesc,
        progress: ratio(stats[AppTexts.burpees]?.exerciseReps ?? 0, 20),
        iconType: AchievementIconType.medal,
      ),
      Achievement(
        title: AppTexts.achievementJumper,
        description: AppTexts.achievementJumperDesc,
        progress: ratio(stats[AppTexts.jumpingJacks]?.exerciseReps ?? 0, 200),
        iconType: AchievementIconType.cup,
      ),
      Achievement(
        title: AppTexts.achievementCrunchChampion,
        description: AppTexts.achievementCrunchChampionDesc,
        progress: ratio(stats[AppTexts.crunches]?.exerciseReps ?? 0, 60),
        iconType: AchievementIconType.medal,
      ),
      Achievement(
        title: AppTexts.achievementCyclist,
        description: AppTexts.achievementCyclistDesc,
        progress: ratio(stats[AppTexts.bicycleCrunches]?.exerciseReps ?? 0, 100),
        iconType: AchievementIconType.medal,
      ),
      Achievement(
        title: AppTexts.achievementLifter,
        description: AppTexts.achievementLifterDesc,
        progress: ratio(stats[AppTexts.legRaises]?.exerciseReps ?? 0, 50),
        iconType: AchievementIconType.cup,
      ),
      Achievement(
        title: AppTexts.achievementDailyFighter,
        description: AppTexts.achievementDailyFighterDesc,
        progress: ratio(consecutiveDays, 5),
        iconType: AchievementIconType.medal,
      ),
      Achievement(
        title: AppTexts.achievementIronWill,
        description: AppTexts.achievementIronWillDesc,
        progress: ratio(totalTime / 60, 60),
        iconType: AchievementIconType.cup,
      ),
      Achievement(
        title: AppTexts.achievementTitledAthlete,
        description: AppTexts.achievementTitledAthleteDesc,
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

          final progress = current.progress;
          final isCompleted = progress >= 1.0;
          final iconPath = resolveIconPath(progress);

          return old.copyWith(
            progress: progress,
            isCompleted: isCompleted,
            iconPath: iconPath,
          );
        }).toList();

    return merged;
  }
}
