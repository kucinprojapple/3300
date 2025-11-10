import 'package:json_annotation/json_annotation.dart';

part 'workout_day_record_model.g.dart';

@JsonSerializable()
class WorkoutDayRecord {
  final String date;
  final int totalReps;
  final int totalTime;
  final int workoutCount;

  const WorkoutDayRecord({
    required this.date,
    required this.totalReps,
    required this.totalTime,
    required this.workoutCount,
  });

  WorkoutDayRecord copyWithAdded({
    required int addReps,
    required int addTime,
    bool addWorkout = false,
  }) {
    return WorkoutDayRecord(
      date: date,
      totalReps: totalReps + addReps,
      totalTime: totalTime + addTime,
      workoutCount: workoutCount + (addWorkout ? 1 : 0),
    );
  }

  factory WorkoutDayRecord.fromJson(Map<String, dynamic> json) =>
      _$WorkoutDayRecordFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutDayRecordToJson(this);
}
