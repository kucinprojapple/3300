import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'game_flow_event.dart';
import 'game_flow_state.dart';

class GameFlowBloc extends Bloc<GameFlowEvent, GameFlowState> {
  Timer? _timer;
  int _secondsLeft = 0;

  GameFlowBloc() : super(const GameFlowInitial()) {
    on<StartGameFlowEvent>(_onStartFlow);
    on<SaveResultEvent>(_onSaveResult);
    on<ShowOverlayWowEvent>((event, emit) {
      emit(OverlayWow());
    });
    on<PauseTimerEvent>(_onPauseTimer);
    on<ResumeTimerEvent>(_onResumeTimer);
    on<TimerTickEvent>(_onTimerTick);
  }

  Future<void> _onStartFlow(
    StartGameFlowEvent event,
    Emitter<GameFlowState> emit,
  ) async {
    emit(const OverlayWow());
    await Future.delayed(const Duration(seconds: 2));

    for (int i = 3; i > 0; i--) {
      emit(CountdownOverlay(i));
      await Future.delayed(const Duration(seconds: 1));
    }

    emit(const GoOverlayState());
    await Future.delayed(const Duration(seconds: 1));

    for (int t = 5; t > 0; t--) {
      emit(TimerRunningState(t));
      await Future.delayed(const Duration(seconds: 1));
    }

    emit(const GoodJobOverlayState());
    await Future.delayed(const Duration(seconds: 2));

    emit(const ShowRecordScreenState(10));
  }

  Future<void> _onSaveResult(
    SaveResultEvent event,
    Emitter<GameFlowState> emit,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('exercise_record', event.result);
    emit(const GameFlowDone());
  }

  void _startTimer(Emitter<GameFlowState> emit) {
    _timer?.cancel();
    emit(TimerRunningState(_secondsLeft));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft > 0) {
        _secondsLeft--;
        add(TimerTickEvent(_secondsLeft));
      } else {
        timer.cancel();
        emit(const GoodJobOverlayState());
        Future.delayed(const Duration(seconds: 2), () {
          emit(const ShowRecordScreenState(10));
        });
      }
    });
  }

  void _onTimerTick(TimerTickEvent event, Emitter<GameFlowState> emit) {
    emit(TimerRunningState(event.secondsLeft));
  }

  void _onPauseTimer(PauseTimerEvent event, Emitter<GameFlowState> emit) {
    _timer?.cancel();
    // оставляем текущее состояние таймера, чтобы UI не менялся
  }

  void _onResumeTimer(ResumeTimerEvent event, Emitter<GameFlowState> emit) {
    _startTimer(emit);
  }
}
