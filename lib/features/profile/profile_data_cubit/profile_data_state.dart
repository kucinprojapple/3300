class ProfileDataState {
  final String name;
  final String title;
  final String avatar;
  final int selectedMedalIndex;
  final int totalExercises;
  final int totalReps;
  final int totalTime;
  final int completedAchievements;
  final int totalAchievements;
  final String favoriteExercise;

  const ProfileDataState({
    required this.name,
    required this.title,
    required this.avatar,
    required this.selectedMedalIndex,
    required this.totalExercises,
    required this.totalReps,
    required this.totalTime,
    required this.completedAchievements,
    required this.totalAchievements,
    required this.favoriteExercise,
  });

  ProfileDataState copyWith({
    String? name,
    String? title,
    String? avatar,
    int? selectedMedalIndex,
    int? totalExercises,
    int? totalReps,
    int? totalTime,
    int? completedAchievements,
    int? totalAchievements,
    String? favoriteExercise,
  }) {
    return ProfileDataState(
      name: name ?? this.name,
      title: title ?? this.title,
      avatar: avatar ?? this.avatar,
      selectedMedalIndex: selectedMedalIndex ?? this.selectedMedalIndex,
      totalExercises: totalExercises ?? this.totalExercises,
      totalReps: totalReps ?? this.totalReps,
      totalTime: totalTime ?? this.totalTime,
      completedAchievements:
          completedAchievements ?? this.completedAchievements,
      totalAchievements: totalAchievements ?? this.totalAchievements,
      favoriteExercise: favoriteExercise ?? this.favoriteExercise,
    );
  }

  factory ProfileDataState.initial() => const ProfileDataState(
    name: '',
    title: '',
    avatar: '',
    selectedMedalIndex: 0,
    totalExercises: 0,
    totalReps: 0,
    totalTime: 0,
    completedAchievements: 0,
    totalAchievements: 0,
    favoriteExercise: '',
  );
}
