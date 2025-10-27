import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';

part 'profile_state.dart';

enum ProfileOverlayType { selectPicture, achievements, favoriteExercise }

class ProfileOverlayBloc
    extends Bloc<ProfileOverlayEvent, ProfileOverlayState> {
  ProfileOverlayBloc() : super(const ProfileOverlayInitial()) {
    on<ShowSelectPictureOverlayEvent>(
      (event, emit) => emit(const ProfileOverlaySelectPicture()),
    );
    on<ShowAchievementsOverlayEvent>(
      (event, emit) => emit(const ProfileOverlayAchievements()),
    );
    on<ShowFavoriteExerciseOverlayEvent>(
      (event, emit) => emit(const ProfileOverlayFavoriteExercise()),
    );
    on<HideOverlayEvent>((event, emit) => emit(const ProfileOverlayInitial()));
  }
}
