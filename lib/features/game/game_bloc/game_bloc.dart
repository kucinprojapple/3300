// import 'dart:async';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../../../storage/local_storage_service.dart';
// import 'game_event.dart';
// import 'game_state.dart';
//
// class GameBloc extends Bloc<GameEvent, GameState> {
//   Timer? _timer;
//   int _secondsLeft = 0;
//   late final int _totalSeconds;
//
//   GameBloc() : super(const GameFlowInitial()) {
//     on<StartGameFlowEvent>(_onStartFlow);
//     // on<ShowOverlayWowEvent>((event, emit) {
//     //   emit(OverlayWow());
//     // });
//     on<TimerPauseEvent>(_onTimerPause);
//     on<TimerResumeEvent>(_onTimerResume);
//     on<TimerResetEvent>(_onTimerReset);
//
//     on<TimerTickEvent>(_onTimerTick);
//     on<TimerFinishEvent>(_onTimerFinish);
//     on<SaveResultEvent>(_onSaveResult);
//   }
//
//   Future<void> _onStartFlow(
//     StartGameFlowEvent event,
//     Emitter<GameState> emit,
//   ) async {
//     final storage = LocalStorageService();
//     _totalSeconds = storage.timerDuration;
//     _secondsLeft = _totalSeconds;
//
//     emit(const OverlayWow());
//     await Future.delayed(const Duration(seconds: 2));
//
//     for (int i = 3; i > 0; i--) {
//       emit(CountdownOverlay(i));
//       await Future.delayed(const Duration(seconds: 1));
//     }
//
//     emit(const GoOverlayState());
//     await Future.delayed(const Duration(seconds: 1));
//
//     _startTimer(emit);
//     emit(TimerRunningState(_secondsLeft));
//   }
//
//   void _startTimer(Emitter<GameState> emit) {
//     _timer?.cancel();
//     emit(TimerRunningState(_secondsLeft));
//
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       if (_secondsLeft > 0) {
//         _secondsLeft--;
//         add(TimerTickEvent(_secondsLeft));
//       } else {
//         timer.cancel();
//         add(TimerFinishEvent());
//       }
//     });
//   }
//
//   void _onTimerTick(TimerTickEvent event, Emitter<GameState> emit) {
//     _secondsLeft = event.secondsLeft;
//     emit(TimerRunningState(event.secondsLeft));
//   }
//
//   void _onTimerFinish(
//     TimerFinishEvent event,
//     Emitter<GameState> emit,
//   ) async {
//     await Future.delayed(const Duration(seconds: 1));
//     emit(const GoodJobOverlayState());
//     await Future.delayed(const Duration(seconds: 2));
//     emit(const ShowRecordScreenState(10));
//   }
//
//   void _onTimerPause(TimerPauseEvent event, Emitter<GameState> emit) {
//     _timer?.cancel();
//   }
//
//   void _onTimerResume(TimerResumeEvent event, Emitter<GameState> emit) {
//     if (_secondsLeft > 0) {
//       _startTimer(emit);
//     }
//   }
//
//   void _onTimerReset(TimerResetEvent event, Emitter emit) {
//     _timer?.cancel();
//     _secondsLeft = _totalSeconds;
//     emit(TimerInitialState(_secondsLeft));
//   }
//
//   Future<void> _onSaveResult(
//     SaveResultEvent event,
//     Emitter<GameState> emit,
//   ) async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.setInt('exercise_record', event.result);
//
//     await Future.delayed(const Duration(seconds: 3));
//
//     emit(const GameFlowDone());
//   }
// }

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
    on<TimerTickEvent>(_onTimerTick);
    on<TimerStartResumeEvent>(_onResumeTimer);
    on<TimerPauseEvent>(_onPauseTimer);
    on<TimerStopResetEvent>(_onResetTimer);
    on<TimerFinishEvent>(_onTimerFinish);
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
  }

  void _onTimerTick(TimerTickEvent event, Emitter<GameState> emit) {
    _secondsLeft = event.secondsLeft;
    emit(TimerRunningState(event.secondsLeft));
  }

  void _startTimer(Emitter<GameState> emit) {
    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft > 0) {
        _secondsLeft--;
        add(TimerTickEvent(_secondsLeft));
      } else {
        timer.cancel();
        add(const TimerFinishEvent());
      }
    });

    emit(TimerRunningState(_secondsLeft));
  }

  void _onPauseTimer(TimerPauseEvent event, Emitter<GameState> emit) {
    _timer?.cancel();
    emit(TimerPausedState(_secondsLeft));
  }

  void _onResumeTimer(TimerStartResumeEvent event, Emitter<GameState> emit) {
    if (_secondsLeft > 0) {
      _startTimer(emit);
    }
  }

  void _onResetTimer(TimerStopResetEvent event, Emitter<GameState> emit) {
    _timer?.cancel();
    _secondsLeft = _totalSeconds;
    emit(TimerInitialState(_secondsLeft));
  }

  Future<void> _onTimerFinish(
    TimerFinishEvent event,
    Emitter<GameState> emit,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
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
}
