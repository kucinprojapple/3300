import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/achievement_model.dart';

part 'achievements_overlay_event.dart';
part 'achievements_overlay_state.dart';

class AchievementsOverlayBloc
    extends Bloc<AchievementsOverlayEvent, AchievementsOverlayState> {
  AchievementsOverlayBloc() : super(const AchievementsOverlayInitial()) {
    on<ShowAchievementCongratsOverlayEvent>(
          (event, emit) => emit(AchievementsOverlayCongratsState(event.achievement)),
    );

    on<HideAchievementsOverlayEvent>(
          (event, emit) => emit(const AchievementsOverlayInitial()),
    );
  }
}