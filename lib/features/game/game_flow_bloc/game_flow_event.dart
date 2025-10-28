import 'package:equatable/equatable.dart';

abstract class GameFlowEvent extends Equatable {
  const GameFlowEvent();

  @override
  List<Object?> get props => [];
}

// Запустить флоу (запускает всю цепочку)
class StartGameFlowEvent extends GameFlowEvent {
  const StartGameFlowEvent();
}

// Сохранить результат с экрана рекорда
class SaveResultEvent extends GameFlowEvent {
  final int result;
  const SaveResultEvent(this.result);

  @override
  List<Object?> get props => [result];
}

class ShowOverlayWowEvent extends GameFlowEvent {}

class PauseTimerEvent extends GameFlowEvent {
  const PauseTimerEvent();
}

class ResumeTimerEvent extends GameFlowEvent {
  const ResumeTimerEvent();
}

// Внутреннее событие для обновления секунд (private):
class TimerTickEvent extends GameFlowEvent {
  final int secondsLeft;
  const TimerTickEvent(this.secondsLeft);
}