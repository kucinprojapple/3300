import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/storage/local_storage_service.dart';
import 'profile_data_state.dart';

class ProfileDataCubit extends Cubit<ProfileDataState> {
  final LocalStorageService storage;

  ProfileDataCubit(this.storage) : super(ProfileDataState.initial());

  Future<void> loadProfile() async {
    await storage.ensureInitialized();

    final stats = storage.exerciseStats;
    final achievements = storage.achievements;

    final selectedMedalIndex = storage.getValue<int>('selected_medal_index', 0);

    final totalExercises = stats.keys.length;
    final totalReps = stats.values.fold<int>(
      0,
      (sum, e) => sum + e.exerciseReps,
    );
    final totalTime = stats.values.fold<int>(
      0,
      (sum, e) => sum + e.exerciseTime,
    );
    final completedAchievements =
        achievements.where((a) => a.progress >= 1.0).length;
    final totalAchievements = achievements.length;

    String favoriteExercise = '';
    if (stats.isNotEmpty) {
      final top = stats.values.reduce(
        (a, b) => a.exerciseReps >= b.exerciseReps ? a : b,
      );
      favoriteExercise = top.exerciseName;
    }

    emit(
      state.copyWith(
        name: storage.playerName,
        title: storage.playerTitle,
        avatar: storage.playerAvatar,
        selectedMedalIndex: selectedMedalIndex,
        totalExercises: totalExercises,
        totalReps: totalReps,
        totalTime: totalTime,
        completedAchievements: completedAchievements,
        totalAchievements: totalAchievements,
        favoriteExercise: favoriteExercise,
      ),
    );
  }

  void updateName(String name) {
    storage.setPlayerName(name);
    emit(state.copyWith(name: name));
  }

  void updateTitle(String title) {
    storage.setPlayerTitle(title);
    emit(state.copyWith(title: title));
  }

  void updateAvatar(String avatar) {
    storage.setPlayerAvatar(avatar);
    emit(state.copyWith(avatar: avatar));
  }
  void updateSelectedMedalIndex(int index) {
    storage.setValue<int>('selected_medal_index', index);
    emit(state.copyWith(selectedMedalIndex: index));
  }
}
