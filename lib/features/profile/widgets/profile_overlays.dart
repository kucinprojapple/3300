import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_gym_club/features/profile/widgets/favorite_exercises_overlay.dart';
import 'package:green_gym_club/features/profile/widgets/select_picture_bottom_sheet_overlay.dart';

import '../profile_bloc/profile_bloc.dart';

import 'achievements_overlay.dart';
import 'profile_general_overlay.dart';

class ProfileOverlays extends StatelessWidget {
  const ProfileOverlays({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileOverlayBloc, ProfileOverlayState>(
      builder: (context, state) {
        if (state is ProfileOverlayInitial) {
          return const SizedBox.shrink();
        } else if (state is ProfileOverlaySelectPicture) {
          return const ProfileGeneralOverlay(
            child: SelectPictureBottomSheetOverlay(),
          );
        } else if (state is ProfileOverlayAchievements) {
          return const ProfileGeneralOverlay(child: AchievementsOverlay());
        } else if (state is ProfileOverlayFavoriteExercise) {
          return const ProfileGeneralOverlay(child: FavoriteExercisesOverlay());
        }
        return const SizedBox.shrink();
      },
    );
  }
}
