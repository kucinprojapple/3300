// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_day_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkoutDayRecord _$WorkoutDayRecordFromJson(Map<String, dynamic> json) =>
    WorkoutDayRecord(
      date: json['date'] as String,
      totalReps: (json['totalReps'] as num).toInt(),
      totalTime: (json['totalTime'] as num).toInt(),
      workoutCount: (json['workoutCount'] as num).toInt(),
    );

Map<String, dynamic> _$WorkoutDayRecordToJson(WorkoutDayRecord instance) =>
    <String, dynamic>{
      'date': instance.date,
      'totalReps': instance.totalReps,
      'totalTime': instance.totalTime,
      'workoutCount': instance.workoutCount,
    };
