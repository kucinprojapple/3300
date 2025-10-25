import 'package:equatable/equatable.dart';

abstract class GameEvent extends Equatable {
  const GameEvent();

  @override
  List<Object?> get props => [];
}

class ExerciseSelectedEvent extends GameEvent {
  final int index;
  const ExerciseSelectedEvent(this.index);

  @override
  List<Object?> get props => [index];
}

class ExerciseClosedEvent extends GameEvent {
  const ExerciseClosedEvent();
}
