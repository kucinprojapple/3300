import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'achievement_model.g.dart';

final _uuid = Uuid();

@JsonSerializable()
class Achievement {
  final String id;
  final String title;
  final String description;
  final double progress;
  final bool isCompleted;
  final AchievementIconType? iconType;
  final String? iconPath;

  Achievement({
    String? id,
    required this.title,
    required this.description,
    this.progress = 0.0,
    this.isCompleted = false,
    this.iconType,
    this.iconPath,
  }) : id = id ?? _uuid.v4();

  factory Achievement.fromJson(Map<String, dynamic> json) =>
      _$AchievementFromJson(json);

  Map<String, dynamic> toJson() => _$AchievementToJson(this);

  Achievement copyWith({
    double? progress,
    bool? isCompleted,
    AchievementIconType? iconType,
    String? iconPath,
  }) {
    return Achievement(
      id: id,
      title: title,
      description: description,
      progress: progress ?? this.progress,
      isCompleted: isCompleted ?? this.isCompleted,
      iconType: iconType ?? this.iconType,
      iconPath: iconPath ?? this.iconPath,
    );
  }
}

@JsonEnum()
enum AchievementIconType {
  medal,
  cup,
}
