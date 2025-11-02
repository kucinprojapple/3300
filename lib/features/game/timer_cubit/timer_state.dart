import 'package:equatable/equatable.dart';

abstract class TimerState extends Equatable {
  final int secondsLeft;
  const TimerState(this.secondsLeft);

  @override
  List<Object> get props => [secondsLeft];
}

class TimerInitialState extends TimerState {
  const TimerInitialState(super.seconds);
}

class TimerRunningState extends TimerState {
  const TimerRunningState(super.seconds);
}

class TimerPausedState extends TimerState {
  const TimerPausedState(super.seconds);
}

class TimerResumedState extends TimerState {
  const TimerResumedState(super.seconds);
}

class TimerStoppedState extends TimerState {
  const TimerStoppedState(super.seconds);
}

class TimerFinishedState extends TimerState {
  const TimerFinishedState() : super(0);
}