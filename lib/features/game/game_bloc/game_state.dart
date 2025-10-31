import 'package:equatable/equatable.dart';

abstract class GameState extends Equatable {
  const GameState();

  @override
  List<Object?> get props => [];
}

class GameFlowInitial extends GameState {
  const GameFlowInitial();
}

class OverlayWow extends GameState {
  const OverlayWow();
}

class CountdownOverlay extends GameState {
  final int value;

  const CountdownOverlay(this.value);

  @override
  List<Object?> get props => [value];
}

class GoOverlayState extends GameState {
  const GoOverlayState();
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

class GoodJobOverlayState extends GameState {
  const GoodJobOverlayState();
}

class ShowRecordScreenState extends GameState {
  final int lastResult;

  const ShowRecordScreenState(this.lastResult);

  @override
  List<Object?> get props => [lastResult];
}

class GameFlowDone extends GameState {
  const GameFlowDone();
}
