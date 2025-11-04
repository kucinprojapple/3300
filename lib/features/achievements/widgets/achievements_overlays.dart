import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../core/services/vibration_service.dart';
import '../achievements_overlay_bloc/achievements_overlay_bloc.dart';
import 'achievement_congrats_overlay.dart';

class AchievementsOverlays extends StatelessWidget {
  const AchievementsOverlays({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AchievementsOverlayBloc, AchievementsOverlayState>(
      builder: (context, state) {
        if (state is AchievementsOverlayInitial) {
          return const SizedBox.shrink();
        } else if (state is AchievementsOverlayCongratsState) {
          // VibrationService.heavyImpact();
          Future.microtask(() => VibrationService.heavyImpact());
          return AchievementCongratsOverlay(
            achievement: state.achievement,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
