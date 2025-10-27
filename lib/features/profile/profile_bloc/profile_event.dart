part of 'profile_bloc.dart';

abstract class ProfileOverlayEvent {
  const ProfileOverlayEvent();
}

class ShowSelectPictureOverlayEvent extends ProfileOverlayEvent {
  const ShowSelectPictureOverlayEvent();
}

class ShowAchievementsOverlayEvent extends ProfileOverlayEvent {
  const ShowAchievementsOverlayEvent();
}

class ShowFavoriteExerciseOverlayEvent extends ProfileOverlayEvent {
  const ShowFavoriteExerciseOverlayEvent();
}

class HideOverlayEvent extends ProfileOverlayEvent {
  const HideOverlayEvent();
}
