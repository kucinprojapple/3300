import 'package:equatable/equatable.dart';

abstract class GameState extends Equatable {
  const GameState();

  @override
  List<Object?> get props => [];
}

class GameFlowInitialState extends GameState {
  const GameFlowInitialState();
}

class ShowOverlayWowState extends GameState {
  const ShowOverlayWowState();
}

class ShowCountdownOverlayState extends GameState {
  final int value;

  const ShowCountdownOverlayState(this.value);

  @override
  List<Object?> get props => [value];
}

class ShowGoOverlayState extends GameState {
  const ShowGoOverlayState();
}

class TimerInitialState extends GameState {
  final int secondsLeft;

  const TimerInitialState(this.secondsLeft);

  @override
  List<Object?> get props => [secondsLeft];
}

class TimerRunningState extends GameState {
  final int secondsLeft;

  const TimerRunningState(this.secondsLeft);

  @override
  List<Object?> get props => [secondsLeft];
}

class TimerPausedState extends GameState {
  final int secondsLeft;

  const TimerPausedState(this.secondsLeft);

  @override
  List<Object?> get props => [secondsLeft];
}

class TimerFinishedState extends GameState {
  final int secondsLeft;

  const TimerFinishedState(this.secondsLeft);
}

class GoodJobOverlayState extends GameState {
  const GoodJobOverlayState();
}

class ShowRecordScreenState extends GameState {
  final int lastResult;

  const ShowRecordScreenState(this.lastResult);

  @override
  List<Object?> get props => [lastResult];
}

class RecordSavedState extends GameState {
  const RecordSavedState();
}
