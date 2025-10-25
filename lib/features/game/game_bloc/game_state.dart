import 'package:equatable/equatable.dart';

abstract class GameState extends Equatable {
  const GameState();

  @override
  List<Object?> get props => [];
}

class GameInitialState extends GameState {
  const GameInitialState();
}

class ExerciseNavigateState extends GameState {
  final int index;
  const ExerciseNavigateState({required this.index});

  @override
  List<Object?> get props => [index];
}
