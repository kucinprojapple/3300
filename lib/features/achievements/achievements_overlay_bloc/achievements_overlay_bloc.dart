import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'achievements_overlay_event.dart';
part 'achievements_overlay_state.dart';

class AchievementsOverlayBloc
    extends Bloc<AchievementsOverlayEvent, AchievementsOverlayState> {
  AchievementsOverlayBloc() : super(const AchievementsOverlayInitial()) {
    on<ShowAchievementCongratsOverlayEvent>(
          (event, emit) => emit(AchievementsOverlayCongratsState(event.title)),
    );

    on<HideAchievementsOverlayEvent>(
          (event, emit) => emit(const AchievementsOverlayInitial()),
    );
  }
}