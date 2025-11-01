import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_overlay_event.dart';

part 'profile_overlay_state.dart';

enum ProfileOverlayType { selectPicture, achievements, favoriteExercise }

class ProfileOverlayBloc
    extends Bloc<ProfileOverlayEvent, ProfileOverlayState> {
  ProfileOverlayBloc() : super(const ProfileOverlayInitial()) {
    on<ShowSelectPictureOverlayEvent>(
      (event, emit) => emit(const ProfileOverlaySelectPicture()),
    );
    on<ShowTitleSelectOverlayEvent>(
      (event, emit) => emit(const ProfileOverlayTitleSelectState()),
    );
    on<ShowMedalSelectOverlayEvent>(
      (event, emit) => emit(const ProfileOverlayMedalSelectState()),
    );
    on<HideOverlayEvent>((event, emit) {
      emit(const ProfileOverlayInitial());
    });
  }
}
