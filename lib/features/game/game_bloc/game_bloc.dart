import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../storage/local_storage_service.dart';
import 'game_event.dart';
import 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  Timer? _timer;
  int _secondsLeft = 0;

  GameBloc() : super(const GameFlowInitial()) {
    on<StartGameFlowEvent>(_onStartFlow);
    // on<ShowOverlayWowEvent>((event, emit) {
    //   emit(OverlayWow());
    // });
    on<PauseTimerEvent>(_onPauseTimer);
    on<ResumeTimerEvent>(_onResumeTimer);
    on<TimerTickEvent>(_onTimerTick);
    on<TimerFinishEvent>(_onTimerFinish);
    on<SaveResultEvent>(_onSaveResult);
  }

  Future<void> _onStartFlow(
    StartGameFlowEvent event,
    Emitter<GameState> emit,
  ) async {
    final storage = LocalStorageService();
    final totalSeconds = storage.timerDuration;
    _secondsLeft = totalSeconds;

    emit(const OverlayWow());
    await Future.delayed(const Duration(seconds: 2));

    for (int i = 3; i > 0; i--) {
      emit(CountdownOverlay(i));
      await Future.delayed(const Duration(seconds: 1));
    }

    emit(const GoOverlayState());
    await Future.delayed(const Duration(seconds: 1));

    _startTimer(emit);
    emit(TimerRunningState(_secondsLeft));
  }

  void _startTimer(Emitter<GameState> emit) {
    _timer?.cancel();
    emit(TimerRunningState(_secondsLeft));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft > 0) {
        _secondsLeft--;
        add(TimerTickEvent(_secondsLeft));
      } else {
        timer.cancel();
        add(TimerFinishEvent());
      }
    });
  }

  void _onTimerTick(TimerTickEvent event, Emitter<GameState> emit) {
    _secondsLeft = event.secondsLeft;
    emit(TimerRunningState(event.secondsLeft));
  }

  void _onTimerFinish(
    TimerFinishEvent event,
    Emitter<GameState> emit,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    emit(const GoodJobOverlayState());
    await Future.delayed(const Duration(seconds: 2));
    emit(const ShowRecordScreenState(10));
  }

  void _onPauseTimer(PauseTimerEvent event, Emitter<GameState> emit) {
    _timer?.cancel();
  }

  void _onResumeTimer(ResumeTimerEvent event, Emitter<GameState> emit) {
    if (_secondsLeft > 0) {
      _startTimer(emit);
    }
  }

  Future<void> _onSaveResult(
    SaveResultEvent event,
    Emitter<GameState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('exercise_record', event.result);

    await Future.delayed(const Duration(seconds: 3));

    emit(const GameFlowDone());
  }
}
