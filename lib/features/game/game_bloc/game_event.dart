import 'package:equatable/equatable.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object?> get props => [];
}

class StartGameFlowEvent extends GameEvent {
  const StartGameFlowEvent();
}

class TimerTickEvent extends GameEvent {
  final int secondsLeft;

  const TimerTickEvent(this.secondsLeft);

  @override
  List<Object?> get props => [secondsLeft];
}

class TimerPauseEvent extends GameEvent {
  const TimerPauseEvent();
}

class TimerStartResumeEvent extends GameEvent {
  const TimerStartResumeEvent();
}

class TimerStopResetEvent extends GameEvent {
  const TimerStopResetEvent();
}

class TimerFinishEvent extends GameEvent {
  const TimerFinishEvent();
}

class SaveResultEvent extends GameEvent {
  final int result;

  const SaveResultEvent(this.result);

  @override
  List<Object?> get props => [result];
}
