import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_gym_club/core/services/sound_service.dart';

import '../../../core/storage/local_storage_service.dart';
import '../repository/game_exercise_repository.dart';
import 'game_event.dart';
import 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  final ExerciseRepository repository;
  Timer? _timer;
  int _secondsLeft = 0;
  int _totalSeconds = 0;
  bool _isFlowPaused = false;

  GameBloc(this.repository) : super(const GameFlowInitialState()) {
    on<StartGameFlowEvent>(_onStartFlow);
    on<PauseFlowEvent>(_onPauseFlow);
    on<TimerStartOrResumeEvent>(_onStartOrResume);
    on<TimerPauseEvent>(_onPause);
    on<TimerResetEvent>(_onReset);
    on<TimerTickEvent>(_onTick);
    on<TimerFinishEvent>(_onFinish);
    on<TimerExitEvent>(_onExit);
    on<SaveResultEvent>(_onSaveResult);
  }

  Future<void> _onStartFlow(
    StartGameFlowEvent event,
    Emitter<GameState> emit,
  ) async {
    final storage = LocalStorageService();
    _totalSeconds = storage.timerDuration;
    _secondsLeft = _totalSeconds;
    _isFlowPaused = false;

    emit(const ShowOverlayWowState());
    await Future.delayed(const Duration(seconds: 3));
    if (isClosed || _isFlowPaused) return;

    await SoundService.preloadCountdownSounds();
    for (int i = 3; i > 0; i--) {
      emit(ShowCountdownOverlayState(i));
      SoundService.playCountdown();
      await Future.delayed(const Duration(seconds: 1));
    }

    SoundService.playLongBeep();
    emit(const ShowGoOverlayState());
    await Future.delayed(const Duration(seconds: 2));

    emit(TimerInitialState(_secondsLeft));
    add(const TimerStartOrResumeEvent());
  }

  void _onPauseFlow(PauseFlowEvent event, Emitter<GameState> emit) {
    _isFlowPaused = true;
    emit(GameFlowInitialState());
  }

  void _onStartOrResume(
    TimerStartOrResumeEvent event,
    Emitter<GameState> emit,
  ) {
    _timer?.cancel();

    if (_secondsLeft <= 0) {
      _secondsLeft = _totalSeconds;
    }

    SoundService.startTicking();

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
    SoundService.stopTicking();
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
    SoundService.stopTicking();
    _secondsLeft = 0;

    emit(TimerFinishedState(_secondsLeft));
    emit(const GoodJobOverlayState());

    SoundService.playBeep();

    await Future.delayed(const Duration(seconds: 2));
    emit(const ShowRecordScreenState(10));
  }

  void _onExit(TimerExitEvent event, Emitter<GameState> emit) {
    _timer?.cancel();
    SoundService.stopTicking();
    _secondsLeft = _totalSeconds;

    emit(TimerInitialState(_secondsLeft));
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
