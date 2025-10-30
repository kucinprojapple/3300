import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';
import '../../../core/widgets/action_button_widget.dart';
import '../../../core/widgets/icon_button_widget.dart';
import '../../../storage/local_storage_service.dart';
import '../game_flow_bloc/game_flow_bloc.dart';
import '../game_flow_bloc/game_flow_event.dart';
import '../game_flow_bloc/game_flow_state.dart';
import '../widgets/countdown_overlay_widget.dart';
import '../widgets/exercise_grid_widget.dart';
import '../widgets/go_overlay_widget.dart';
import '../widgets/good_job_overlay_widget.dart';
import '../widgets/wow_overlay_widget.dart';
import 'record_screen.dart';
import 'timer_screen.dart';

@RoutePage()
class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  int _selectedExerciseIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GameFlowBloc(),
      child: BlocConsumer<GameFlowBloc, GameFlowState>(
        listener: (context, state) {
          if (state is GameFlowDone) {
            context.router.popUntilRoot();
          }
        },
        builder: (context, gameFlowState) {
          if (gameFlowState is TimerRunningState) {
            final totalSeconds = LocalStorageService().timerDuration;

            return TimerScreen(
              secondsLeft: gameFlowState.secondsLeft,
              totalSeconds: totalSeconds,
              onStart: () {
                context.read<GameFlowBloc>().add(const ResumeTimerEvent());
              },
              onPause: () {
                context.read<GameFlowBloc>().add(const PauseTimerEvent());
              },
            );
          }
          return Material(
            color: Colors.transparent,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    AppAssets.backgroundMain,
                    fit: BoxFit.fill,
                  ),
                ),

                Positioned(
                  left: 30.w,
                  top: 48.h,
                  child: Column(
                    children: [
                      IconButtonWidget(
                        iconAsset: AppAssets.iconPause,
                        onPressed: () {
                          // todo: add action
                          context.router.maybePop();
                        },
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
                Positioned(
                  left: 18.w,
                  bottom: 272.h,
                  right: 18.w,
                  child: Image.asset(AppAssets.slotContainer),
                ),

                Positioned(
                  left: 18.w,
                  bottom: 260.h,
                  right: 18.w,
                  child: ExerciseGridWidget(
                    onExerciseSelected: (index) {
                      setState(() => _selectedExerciseIndex = index);
                    },
                  ),
                ),

                Positioned(
                  left: 0.w,
                  bottom: 160.h,
                  right: 0.w,
                  child: Center(
                    child: ActionButtonWidget(
                      width: 227.w,
                      height: 89.h,
                      text: 'Play',
                      fontSize: 30.sp,

                      onPressed: () {
                        context.read<GameFlowBloc>().add(
                          const StartGameFlowEvent(),
                        );
                      },
                    ),
                  ),
                ),

                if (gameFlowState is OverlayWow)
                  WowOverlayWidget(index: _selectedExerciseIndex),
                if (gameFlowState is CountdownOverlay)
                  CountdownOverlayWidget(value: gameFlowState.value),
                if (gameFlowState is GoOverlayState) GoOverlayWidget(),

                if (gameFlowState is GoodJobOverlayState)
                  GoodJobOverlayWidget(),
                if (gameFlowState is ShowRecordScreenState)
                  RecordScreen(
                    index: 2,
                    lastResult: gameFlowState.lastResult,
                    onSave: (value) {
                      context.read<GameFlowBloc>().add(SaveResultEvent(value));
                    },
                  ),
              ],
            ),
          );
        },
        // ),
      ),
    );
  }
}
