import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';
import '../../../app_core_design/styles.dart';
import '../../../app_core_design/texts.dart';
import '../../../core/storage/local_storage_service.dart';
import '../../../core/widgets/action_button_widget.dart';
import '../../../core/widgets/icon_button_widget.dart';
import '../game_bloc/game_bloc.dart';
import '../game_bloc/game_event.dart';
import '../game_bloc/game_state.dart';
import '../repository/game_exercise_repository.dart';
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
      create: (_) => GameBloc(ExerciseRepository()),
      child: BlocConsumer<GameBloc, GameState>(
        listener: (context, state) {},
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
          return Scaffold(
            body: Stack(
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
                  left: 12.w,
                  top: 150.h,
                  right: 12.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      MainTextBody.gradientText(
                        context,
                        'Tap on the card \nfor choose an exercise',
                        size: TextSize.s,
                        alignment: Alignment.bottomCenter,
                        useShadow: false,
                        height: 1.1,
                      ),
                      SizedBox(height: 12.h),
                      SizedBox(
                        width: 324.w,
                        height: 368.h,
                        child: Stack(
                          children: [
                            ExerciseGridWidget(
                              onExerciseSelected: (index) {
                                setState(() => _selectedExerciseIndex = index);
                              },
                            ),
                            Positioned.fill(
                              top: 24.h,
                              child: IgnorePointer(
                                child: Image.asset(
                                  AppAssets.slotContainer,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 32.h),
                      ActionButtonWidget(
                        width: 224.w,
                        height: 88.h,
                        text: AppTexts.buttonStart,
                        fontSize: 30.sp,
                        onPressed: () {
                          context.read<GameBloc>().add(
                            const StartGameFlowEvent(),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                if (gameFlowState is ShowOverlayWowState)
                  WowOverlayWidget(index: _selectedExerciseIndex),
                if (gameFlowState is ShowCountdownOverlayState)
                  CountdownOverlayWidget(value: gameFlowState.value),
                if (gameFlowState is ShowGoOverlayState) GoOverlayWidget(),

                if (gameFlowState is GoodJobOverlayState)
                  GoodJobOverlayWidget(),
                if (gameFlowState is ShowRecordScreenState)
                  RecordScreen(index: _selectedExerciseIndex),
              ],
            ),
          );
        },
      ),
    );
  }
}
