import 'package:equatable/equatable.dart';

// Базовое состояние
abstract class GameFlowState extends Equatable {
  const GameFlowState();
  @override
  List<Object?> get props => [];
}

// Ожидание (пустота)
class GameFlowInitial extends GameFlowState {
  const GameFlowInitial();
}

// Оверлей WOW!
class OverlayWow extends GameFlowState {
  const OverlayWow();
}

// Оверлей Countdown (3/2/1)
class CountdownOverlay extends GameFlowState {
  final int value;
  const CountdownOverlay(this.value);

  @override
  List<Object?> get props => [value];
}

// Оверлей GO!
class GoOverlayState extends GameFlowState {
  const GoOverlayState();
}

// Экран таймера
class TimerRunningState extends GameFlowState {
  final int secondsLeft;
  const TimerRunningState(this.secondsLeft);

  @override
  List<Object?> get props => [secondsLeft];
}

// Оверлей Good Job!
class GoodJobOverlayState extends GameFlowState {
  const GoodJobOverlayState();
}

// Экран рекорда (тут можно передавать результат)
class ShowRecordScreenState extends GameFlowState {
  final int lastResult; // например, количество повторений
  const ShowRecordScreenState(this.lastResult);

  @override
  List<Object?> get props => [lastResult];
}

// Завершение флоу
class GameFlowDone extends GameFlowState {
  const GameFlowDone();
}
