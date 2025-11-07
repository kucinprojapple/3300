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

class TimerStartOrResumeEvent extends GameEvent {
  const TimerStartOrResumeEvent();
}

class TimerResetEvent extends GameEvent {
  const TimerResetEvent();
}

class TimerFinishEvent extends GameEvent {
  const TimerFinishEvent();
}

class TimerExitEvent extends GameEvent {
  const TimerExitEvent();
}

class SaveResultEvent extends GameEvent {
  final String exerciseName;
  final int exerciseTime;
  final int exerciseReps;

  const SaveResultEvent({
    required this.exerciseName,
    required this.exerciseTime,
    required this.exerciseReps,
  });

  @override
  List<Object?> get props => [exerciseName, exerciseTime, exerciseReps];
}
