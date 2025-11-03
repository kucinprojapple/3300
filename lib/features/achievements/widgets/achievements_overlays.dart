import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_gym_club/features/achievements/widgets/achievement_congrats_overlay.dart';
import '../achievements_overlay_bloc/achievements_overlay_bloc.dart';

class AchievementsOverlays extends StatelessWidget {
  const AchievementsOverlays({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AchievementsOverlayBloc, AchievementsOverlayState>(
      builder: (context, state) {
        if (state is AchievementsOverlayInitial) {
          return const SizedBox.shrink();
        } else if (state is AchievementsOverlayCongratsState) {
          return AchievementCongratsOverlay();
        }
        return const SizedBox.shrink();
      },
    );
  }
}
