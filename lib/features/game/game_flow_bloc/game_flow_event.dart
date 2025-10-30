import 'package:equatable/equatable.dart';

abstract class GameFlowEvent extends Equatable {
  const GameFlowEvent();

  @override
  List<Object?> get props => [];
}

class StartGameFlowEvent extends GameFlowEvent {
  const StartGameFlowEvent();
}

class ShowOverlayWowEvent extends GameFlowEvent {}

class PauseTimerEvent extends GameFlowEvent {
  const PauseTimerEvent();
}

class ResumeTimerEvent extends GameFlowEvent {
  const ResumeTimerEvent();
}

class TimerTickEvent extends GameFlowEvent {
  final int secondsLeft;

  const TimerTickEvent(this.secondsLeft);
}

class TimerFinishEvent extends GameFlowEvent {
  const TimerFinishEvent();
}

class SaveResultEvent extends GameFlowEvent {
  final int result;

  const SaveResultEvent(this.result);

  @override
  List<Object?> get props => [result];
}
