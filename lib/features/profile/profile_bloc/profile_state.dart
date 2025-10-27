part of 'profile_bloc.dart';

abstract class ProfileOverlayState {
  const ProfileOverlayState();
}

class ProfileOverlayInitial extends ProfileOverlayState {
  const ProfileOverlayInitial();
}

class ProfileOverlaySelectPicture extends ProfileOverlayState {
  const ProfileOverlaySelectPicture();
}

class ProfileOverlayAchievements extends ProfileOverlayState {
  const ProfileOverlayAchievements();
}

class ProfileOverlayFavoriteExercise extends ProfileOverlayState {
  const ProfileOverlayFavoriteExercise();
}
