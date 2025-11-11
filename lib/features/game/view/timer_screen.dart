import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';
import '../../../app_core_design/text_styles.dart';
import '../../../core/widgets/icon_button_widget.dart';
import '../game_bloc/game_bloc.dart';
import '../game_bloc/game_event.dart';
import '../game_bloc/game_state.dart';
import '../widgets/custom_gradient_circular_timer.dart';

@RoutePage()
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
    return BlocBuilder<GameBloc, GameState>(
      builder: (context, state) {
        final bloc = context.read<GameBloc>();

        int seconds = secondsLeft;
        if (state is TimerRunningState) seconds = state.secondsLeft;
        if (state is TimerPausedState) seconds = state.secondsLeft;
        if (state is TimerInitialState) seconds = state.secondsLeft;

        final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
        final secs = (seconds % 60).toString().padLeft(2, '0');

        final isRunning = state is TimerRunningState;
        final isPaused = state is TimerPausedState;

        return PopScope(
          canPop: true,
          onPopInvokedWithResult: (didPop, result) {
            bloc.add(const TimerExitEvent());
          },
          child: Scaffold(
            body: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                      AppAssets.backgroundMain, fit: BoxFit.fill),
                ),

                /// Кнопка "Назад"
                Positioned(
                  left: 30.w,
                  top: 48.h,
                  child: CustomIconButtonWidget(
                    iconAsset: AppAssets.iconBack,
                    onPressed: () {
                      bloc.add(const TimerExitEvent());
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
                              progress: 1 - (seconds / totalSeconds),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 32.h),

                      MainTextBody.gradientText(
                        context,
                        '$minutes:$secs',
                        fontSize: 35.sp,
                        alignment: Alignment.center,
                        useGradient: false,
                        useShadow: false,
                        height: 1.0,
                      ),

                      SizedBox(height: 32.h),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Opacity(
                            opacity: isRunning ? 0.4 : 1.0,
                            child: IgnorePointer(
                              ignoring: isRunning,
                              child: IconButton(
                                onPressed: () =>
                                    bloc.add(const TimerStartOrResumeEvent()),
                                icon: SizedBox(
                                  width: 72.w,
                                  height: 72.h,
                                  child: Image.asset(
                                    AppAssets.iconTimerPlay,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(width: 16.w),

                          IconButton(
                            onPressed: () {
                              if (isRunning) {
                                bloc.add(const TimerPauseEvent());
                              } else if (isPaused) {
                                bloc.add(const TimerResetEvent());
                              }
                            },
                            icon: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 200),
                              child: SizedBox(
                                key: ValueKey(isRunning),
                                width: 72.w,
                                height: 72.h,
                                child: Image.asset(
                                  isRunning
                                      ? AppAssets.iconTimerPause
                                      : AppAssets.iconTimerStop,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}