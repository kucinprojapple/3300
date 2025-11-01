part of 'profile_overlay_bloc.dart';

abstract class ProfileOverlayEvent {
  const ProfileOverlayEvent();
}

class ShowSelectPictureOverlayEvent extends ProfileOverlayEvent {
  const ShowSelectPictureOverlayEvent();
}

class ShowTitleSelectOverlayEvent extends ProfileOverlayEvent {
  const ShowTitleSelectOverlayEvent();
}

class ShowMedalSelectOverlayEvent extends ProfileOverlayEvent {
  const ShowMedalSelectOverlayEvent();
}

class HideOverlayEvent extends ProfileOverlayEvent {
  const HideOverlayEvent();
}
