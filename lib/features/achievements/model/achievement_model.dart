  class Achievement {
  final String title;
  final String description;
  final double progress;
  final AchievementIconType iconType;

  Achievement({
    required this.title,
    required this.description,
    required this.progress,
    required this.iconType,
  });
}

enum AchievementIconType { medal, cup }
