import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/storage/local_storage_service.dart';
import '../repository/game_exercise_repository.dart';
import 'game_event.dart';
import 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final ExerciseRepository repository;
  Timer? _timer;
  int _secondsLeft = 0;
  int _totalSeconds = 0;

  GameBloc(this.repository) : super(const GameFlowInitialState()) {
    on<StartGameFlowEvent>(_onStartFlow);
    on<TimerStartOrResumeEvent>(_onStartOrResume);
    on<TimerPauseEvent>(_onPause);
    on<TimerResetEvent>(_onReset);
    on<TimerTickEvent>(_onTick);
    on<TimerFinishEvent>(_onFinish);
    on<SaveResultEvent>(_onSaveResult);
  }

  Future<void> _onStartFlow(
    StartGameFlowEvent event,
    Emitter<GameState> emit,
  ) async {
    final storage = LocalStorageService();
    _totalSeconds = storage.timerDuration;
    _secondsLeft = _totalSeconds;

    emit(const ShowOverlayWowState());
    await Future.delayed(const Duration(seconds: 2));

    if (isClosed) return;

    for (int i = 3; i > 0; i--) {
      emit(ShowCountdownOverlayState(i));
      await Future.delayed(const Duration(seconds: 1));
    }

    emit(const ShowGoOverlayState());
    await Future.delayed(const Duration(seconds: 1));

    emit(TimerInitialState(_secondsLeft));

    add(const TimerStartOrResumeEvent());
  }

  void _onStartOrResume(
    TimerStartOrResumeEvent event,
    Emitter<GameState> emit,
  ) {
    _timer?.cancel();

    if (_secondsLeft <= 0) {
      _secondsLeft = _totalSeconds;
    }

    emit(TimerRunningState(_secondsLeft));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft > 0) {
        _secondsLeft--;
        add(TimerTickEvent(_secondsLeft));
      } else {
        timer.cancel();
        add(const TimerFinishEvent());
      }
    });
  }

  void _onTick(TimerTickEvent event, Emitter<GameState> emit) {
    _secondsLeft = event.secondsLeft;
    emit(TimerRunningState(_secondsLeft));
  }

  void _onPause(TimerPauseEvent event, Emitter<GameState> emit) {
    _timer?.cancel();
    emit(TimerPausedState(_secondsLeft));
  }

  void _onReset(TimerResetEvent event, Emitter<GameState> emit) {
    _timer?.cancel();
    _secondsLeft = _totalSeconds;
    emit(TimerInitialState(_secondsLeft));
  }

  Future<void> _onFinish(
    TimerFinishEvent event,
    Emitter<GameState> emit,
  ) async {
    _timer?.cancel();
    emit(const GoodJobOverlayState());
    await Future.delayed(const Duration(seconds: 2));
    emit(const ShowRecordScreenState(10));
  }

  Future<void> _onSaveResult(
    SaveResultEvent event,
    Emitter<GameState> emit,
  ) async {
    await repository.saveExerciseProgress(
      exerciseName: event.exerciseName,
      exerciseTime: event.exerciseTime,
      exerciseReps: event.exerciseReps,
    );
    emit(const RecordSavedState());
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
