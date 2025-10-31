import 'package:equatable/equatable.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object?> get props => [];
}

class StartGameFlowEvent extends GameEvent {
  const StartGameFlowEvent();
}

class ShowOverlayWowEvent extends GameEvent {}

class PauseTimerEvent extends GameEvent {
  const PauseTimerEvent();
}

class ResumeTimerEvent extends GameEvent {
  const ResumeTimerEvent();
}

class TimerTickEvent extends GameEvent {
  final int secondsLeft;

  const TimerTickEvent(this.secondsLeft);
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
