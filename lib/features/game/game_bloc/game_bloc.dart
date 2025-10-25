import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'game_event.dart';
import 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(const GameInitialState()) {
    on<ExerciseSelectedEvent>(_onExerciseSelected);
    on<ExerciseClosedEvent>(_onExerciseClosed);
  }

  Future<void> _onExerciseSelected(
    ExerciseSelectedEvent event,
    Emitter<GameState> emit,
  ) async {
    emit(ExerciseNavigateState(index: event.index));
  }

  Future<void> _onExerciseClosed(
    ExerciseClosedEvent event,
    Emitter<GameState> emit,
  ) async {
    emit(const GameInitialState());
  }
}
