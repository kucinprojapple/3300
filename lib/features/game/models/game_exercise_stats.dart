import 'package:flutter/material.dart';

@immutable
class GameExerciseStats {
  final String exerciseName;
  final int exerciseTime;
  final int exerciseReps;

  const GameExerciseStats({
    required this.exerciseName,
    this.exerciseTime = 0,
    this.exerciseReps = 0,
  });

  factory GameExerciseStats.fromJson(Map<String, dynamic> json) =>
      GameExerciseStats(
        exerciseName: json['exerciseName'] ?? '',
        exerciseTime: json['exerciseTime'] ?? 0,
        exerciseReps: json['exerciseReps'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
    'exerciseName': exerciseName,
    'exerciseTime': exerciseTime,
    'exerciseReps': exerciseReps,
  };

  GameExerciseStats copyWith({
    String? exerciseName,
    int? exerciseTime,
    int? exerciseReps,
  }) => GameExerciseStats(
    exerciseName: exerciseName ?? this.exerciseName,
    exerciseTime: exerciseTime ?? this.exerciseTime,
    exerciseReps: exerciseReps ?? this.exerciseReps,
  );

  GameExerciseStats operator +(GameExerciseStats other) => GameExerciseStats(
    exerciseName: exerciseName.isNotEmpty ? exerciseName : other.exerciseName,
    exerciseTime: exerciseTime + other.exerciseTime,
    exerciseReps: exerciseReps + other.exerciseReps,
  );

  @override
  String toString() =>
      'ExerciseStats('
      'name: $exerciseName, '
      'time: $exerciseTime, '
      'reps: $exerciseReps'
      ')';
}
