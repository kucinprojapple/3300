import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';
import '../../../app_core_design/styles.dart';
import '../../../core/widgets/action_button_widget.dart';
import '../../../core/widgets/icon_button_widget.dart';
import '../../../storage/local_storage_service.dart';
import '../../exercises/data/exercise_list.dart';
import '../game_bloc/game_bloc.dart';
import '../game_bloc/game_event.dart';
import '../game_bloc/game_state.dart';
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
      create: (_) => GameBloc(),
      child: BlocConsumer<GameBloc, GameState>(
        listener: (context, state) {
          if (state is GameFlowDone) {
            context.router.popUntilRoot();
          }
        },
        builder: (context, gameFlowState) {
          if (gameFlowState is TimerInitialState ||
              gameFlowState is TimerRunningState ||
              gameFlowState is TimerPausedState) {
            final totalSeconds = LocalStorageService().timerDuration;
            final secondsLeft =
                gameFlowState is TimerInitialState
                    ? gameFlowState.secondsLeft
                    : gameFlowState is TimerRunningState
                    ? gameFlowState.secondsLeft
                    : (gameFlowState as TimerPausedState).secondsLeft;

            return TimerScreen(
              secondsLeft: secondsLeft,
              totalSeconds: totalSeconds,
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
                  child: IconButtonWidget(
                    iconAsset: AppAssets.iconBack,
                    onPressed: () {
                      context.router.maybePop();
                    },
                  ),
                ),
                Positioned(
                  left: 18.w,
                  top: 150.h,
                  right: 18.w,
                  child: MainTextBody.gradientText(
                    context,
                    'Tap on the card \nfor choose an exercise',
                    size: TextSize.s,
                    alignment: Alignment.bottomCenter,
                    useShadow: false,
                    height: 1.1,
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
                      text: 'Start',
                      fontSize: 30.sp,

                      onPressed: () {
                        context.read<GameBloc>().add(
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
                    index: _selectedExerciseIndex,
                    lastResult: gameFlowState.lastResult,
                    onSave: (value) {
                      final exerciseName =
                          exercisesData[_selectedExerciseIndex].name;
                      final storage = LocalStorageService();
                      final seconds = storage.timerDuration;

                      context.read<GameBloc>().add(
                        SaveResultEvent(
                          exerciseName: exerciseName,
                          seconds: seconds,
                          result: value,
                        ),
                      );
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
