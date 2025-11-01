part of 'profile_overlay_bloc.dart';

abstract class ProfileOverlayState {
  const ProfileOverlayState();
}

class ProfileOverlayInitial extends ProfileOverlayState {
  const ProfileOverlayInitial();
}

class ProfileOverlaySelectPicture extends ProfileOverlayState {
  const ProfileOverlaySelectPicture();
}

class ProfileOverlayTitleSelectState extends ProfileOverlayState {
  const ProfileOverlayTitleSelectState();
}

class ProfileOverlayMedalSelectState extends ProfileOverlayState {
  const ProfileOverlayMedalSelectState();
}
