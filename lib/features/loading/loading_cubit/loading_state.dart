import 'package:equatable/equatable.dart';

abstract class LoadingState extends Equatable {
  const LoadingState();

  @override
  List<Object?> get props => [];
}

class LoadingInitial extends LoadingState {
  const LoadingInitial();
}

class LoadingInProgress extends LoadingState {
  final double progress;

  const LoadingInProgress(this.progress);

  @override
  List<Object?> get props => [progress];
}

class LoadingCompleted extends LoadingState {
  const LoadingCompleted();
}