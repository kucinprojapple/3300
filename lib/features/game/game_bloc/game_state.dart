import 'package:equatable/equatable.dart';

// Базовое состояние
abstract class GameState extends Equatable {
  const GameState();
  @override
  List<Object?> get props => [];
}

// Ожидание (пустота)
class GameFlowInitial extends GameState {
  const GameFlowInitial();
}

// Оверлей WOW!
class OverlayWow extends GameState {
  const OverlayWow();
}

// Оверлей Countdown (3/2/1)
class CountdownOverlay extends GameState {
  final int value;
  const CountdownOverlay(this.value);

  @override
  List<Object?> get props => [value];
}

// Оверлей GO!
class GoOverlayState extends GameState {
  const GoOverlayState();
}

// Экран таймера
class TimerRunningState extends GameState {
  final int secondsLeft;
  const TimerRunningState(this.secondsLeft);

  @override
  List<Object?> get props => [secondsLeft];
}

// Оверлей Good Job!
class GoodJobOverlayState extends GameState {
  const GoodJobOverlayState();
}

// Экран рекорда (тут можно передавать результат)
class ShowRecordScreenState extends GameState {
  final int lastResult; // например, количество повторений
  const ShowRecordScreenState(this.lastResult);

  @override
  List<Object?> get props => [lastResult];
}

// Завершение флоу
class GameFlowDone extends GameState {
  const GameFlowDone();
}
