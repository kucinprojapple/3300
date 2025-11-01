import 'package:equatable/equatable.dart';

abstract class LoadingState extends Equatable {
  const LoadingState();

  @override
  List<Object?> get props => [];
}

class LoadingInitialState extends LoadingState {
  const LoadingInitialState();
}

class LoadingInProgressState extends LoadingState {
  final double progress;

  const LoadingInProgressState(this.progress);

  @override
  List<Object?> get props => [progress];
}

class LoadingCompletedState extends LoadingState {
  const LoadingCompletedState();
}
