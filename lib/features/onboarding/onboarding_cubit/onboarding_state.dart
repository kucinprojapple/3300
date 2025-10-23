import 'package:equatable/equatable.dart';

class OnboardingState extends Equatable {
  final int pageIndex;
  final bool finished;

  const OnboardingState({required this.pageIndex, this.finished = false});

  @override
  List<Object?> get props => [pageIndex, finished];
}