// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Achievement _$AchievementFromJson(Map<String, dynamic> json) => Achievement(
  id: json['id'] as String?,
  title: json['title'] as String,
  description: json['description'] as String,
  progress: (json['progress'] as num?)?.toDouble() ?? 0.0,
  isCompleted: json['isCompleted'] as bool? ?? false,
  iconType: $enumDecodeNullable(_$AchievementIconTypeEnumMap, json['iconType']),
  iconPath: json['iconPath'] as String?,
);

Map<String, dynamic> _$AchievementToJson(Achievement instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'progress': instance.progress,
      'isCompleted': instance.isCompleted,
      'iconType': _$AchievementIconTypeEnumMap[instance.iconType],
      'iconPath': instance.iconPath,
    };

const _$AchievementIconTypeEnumMap = {
  AchievementIconType.medal: 'medal',
  AchievementIconType.cup: 'cup',
};
