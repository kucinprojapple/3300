import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'timer_state.dart';
import '../../../core/storage/local_storage_service.dart';

class TimerCubit extends Cubit<TimerState> {
  final LocalStorageService storage;
  Timer? _timer;
  int _totalSeconds = 0;
  int _secondsLeft = 0;

  TimerCubit(this.storage) : super(const TimerInitialState(0));

  Future<void> initializeTimer() async {
    _totalSeconds = storage.timerDuration;
    _secondsLeft = _totalSeconds;
    emit(TimerInitialState(_secondsLeft));
  }

  void startTimer() {
    _timer?.cancel();
    emit(TimerRunningState(_secondsLeft));

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft > 0) {
        _secondsLeft--;
        emit(TimerRunningState(_secondsLeft));
      } else {
        timer.cancel();
        emit(const TimerFinishedState());
      }
    });
  }

  void pauseTimer() {
    _timer?.cancel();
    emit(TimerPausedState(_secondsLeft));
  }

  void resumeTimer() {
    if (_secondsLeft > 0) {
      emit(TimerResumedState(_secondsLeft));
      startTimer();
    }
  }

  void stopTimer() {
    _timer?.cancel();
    _secondsLeft = _totalSeconds;
    emit(TimerStoppedState(_secondsLeft));
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
