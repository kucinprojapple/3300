import 'dart:async';
import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loading_state.dart';

class LoadingCubit extends Cubit<LoadingState> {
  LoadingCubit() : super(const LoadingInitialState());

  final _random = Random();

  Future<void> startLoading() async {
    emit(const LoadingInProgressState(0.0));

    final List<_FakeStage> stages = [
      _FakeStage('Initializing engine'),
      _FakeStage('Loading assets'),
      _FakeStage('Connecting to database'),
      _FakeStage('Preparing gameplay'),
      _FakeStage('Finalizing setup'),
    ];

    stages.shuffle(_random);

    final weights = List<double>.generate(
      stages.length,
      (_) => _random.nextDouble(),
    );
    final totalWeight = weights.reduce((a, b) => a + b);
    for (int i = 0; i < stages.length; i++) {
      stages[i] = stages[i].copyWith(progressWeight: weights[i] / totalWeight);
    }

    double progress = 0.0;

    for (final stage in stages) {
      final target = (progress + stage.progressWeight).clamp(0.0, 1.0);
      final durationMs = 100 + _random.nextInt(101);
      final stepDuration = Duration(milliseconds: durationMs);
      final startTime = DateTime.now();

      while (true) {
        final elapsed = DateTime.now().difference(startTime);
        final t = (elapsed.inMilliseconds / stepDuration.inMilliseconds).clamp(
          0.0,
          1.0,
        );
        final current = progress + (target - progress) * t;
        emit(LoadingInProgressState(current));
        if (t >= 1.0) break;
        await Future.delayed(const Duration(milliseconds: 20));
      }

      progress = target;
      final pauseDuration = Duration(milliseconds: 50 + _random.nextInt(51));
      await Future.delayed(pauseDuration);
    }

    emit(const LoadingInProgressState(1.0));
    await Future.delayed(const Duration(milliseconds: 100));
    emit(const LoadingCompletedState());
  }
}

class _FakeStage extends Equatable {
  final String name;
  final double progressWeight;

  const _FakeStage(this.name, {this.progressWeight = 0.0});

  _FakeStage copyWith({double? progressWeight}) =>
      _FakeStage(name, progressWeight: progressWeight ?? this.progressWeight);

  @override
  List<Object?> get props => [name, progressWeight];
}
