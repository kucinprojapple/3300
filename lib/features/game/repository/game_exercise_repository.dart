import '../../../core/storage/local_storage_service.dart';

import '../models/game_exercise_stats.dart';

class ExerciseRepository {
  final LocalStorageService _storage = LocalStorageService();

  Future<void> saveExerciseProgress({
    required String exerciseName,
    required int exerciseTime,
    required int exerciseReps,
  }) async {
    await _storage.addExerciseProgress(
      exerciseName: exerciseName,
      exerciseTime: exerciseTime,
      exerciseReps: exerciseReps,
    );
  }

  Future<Map<String, GameExerciseStats>> loadAllStats() async {
    await _storage.ensureInitialized();
    return _storage.exerciseStats;
  }
}
