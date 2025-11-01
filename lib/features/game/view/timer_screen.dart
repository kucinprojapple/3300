import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';
import '../../../app_core_design/styles.dart';
import '../../../core/widgets/icon_button_widget.dart';
import '../game_bloc/game_bloc.dart';
import '../game_bloc/game_event.dart';
import '../game_bloc/game_state.dart';
import '../widgets/custom_gradient_circular_timer.dart';

class TimerScreen extends StatelessWidget {
  final int secondsLeft;
  final int totalSeconds;

  const TimerScreen({
    super.key,
    required this.secondsLeft,
    required this.totalSeconds,
  });

  @override
  Widget build(BuildContext context) {
    final minutes = (secondsLeft ~/ 60).toString().padLeft(2, '0');
    final seconds = (secondsLeft % 60).toString().padLeft(2, '0');

    return Scaffold(
      body: BlocBuilder<GameBloc, GameState>(
        builder: (context, state) {
          final isRunning = state is TimerRunningState;
          final isPaused = state is TimerPausedState;
          final isInitial = state is TimerInitialState;

          return Stack(
            children: [
              Positioned.fill(
                child: Image.asset(AppAssets.backgroundMain, fit: BoxFit.fill),
              ),
              Positioned(
                left: 30.w,
                top: 48.h,
                child: IconButtonWidget(
                  iconAsset: AppAssets.iconBack,
                  onPressed: () {
                    context.router.maybePop();
                  },
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 200.h),
                    SizedBox(
                      width: 260.w,
                      height: 260.h,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomGradientCircularTimer(
                            progress: 1 - (secondsLeft / totalSeconds),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 32.h),

                    MainTextBody.gradientText(
                      context,
                      '$minutes:$seconds',
                      size: TextSize.m,
                      alignment: Alignment.center,
                      useGradient: false,
                      useShadow: false,
                      height: 1.0,
                      fontSize: 35.sp,
                    ),
                    SizedBox(height: 32.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          // iconSize: 82.w,
                          onPressed: () {
                            final bloc = context.read<GameBloc>();
                            if (isInitial) {
                              bloc.add(const TimerStartResumeEvent());
                            } else if (isPaused) {
                              bloc.add(const TimerStartResumeEvent());
                            } else if (isRunning) {
                              bloc.add(const TimerPauseEvent());
                            }
                          },
                          icon: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 200),
                            child: SizedBox(
                              width: 72.w,
                              height: 72.h,
                              child: Image.asset(
                                isRunning
                                    ? AppAssets.iconPause
                                    : AppAssets.iconTimerPlay,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        IconButton(
                          // iconSize: 82.w,
                          onPressed: () {
                            context.read<GameBloc>().add(
                              const TimerStopResetEvent(),
                            );
                          },
                          icon: SizedBox(
                              width: 72.w,
                              height: 72.h,
                              child: Image.asset(AppAssets.iconTimerStop)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
