import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_gym_club/features/game/game_bloc/game_bloc.dart';
import 'package:green_gym_club/features/game/view/record_screen.dart';
import 'package:green_gym_club/features/game/widgets/wow_overlay_widget.dart';

import '../../../app_core_design/assets.dart';
import '../../../core/widgets/action_button_widget.dart';
import '../../../core/widgets/icon_button_widget.dart';
import '../../../router/router.dart';
import '../game_bloc/game_event.dart';
import '../game_bloc/game_state.dart';
import '../game_flow_bloc/game_flow_bloc.dart';
import '../game_flow_bloc/game_flow_event.dart';
import '../game_flow_bloc/game_flow_state.dart';
import '../widgets/countdown_overlay_widget.dart';
import '../../exercises/view/exercise_details_screen.dart';
import '../widgets/exercise_grid_widget.dart';
import '../widgets/go_overlay_widget.dart';
import '../widgets/good_job_overlay_widget.dart';
import 'timer_screen.dart';

@RoutePage()
class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GameBloc>(create: (_) => GameBloc()),
        BlocProvider<GameFlowBloc>(create: (_) => GameFlowBloc()),
      ],
      child: BlocListener<GameBloc, GameState>(
        listener: (context, state) {
          if (state is ExerciseNavigateState) {
            context.router.push(ExerciseDetailsRoute(index: state.index)).then((
              _,
            ) {
              context.read<GameBloc>().add(const ExerciseClosedEvent());
            });
          }
        },
        child: BlocConsumer<GameFlowBloc, GameFlowState>(
          listener: (context, state) {
            if (state is GameFlowDone) {
              context.router.popUntilRoot();
            }
          },
          builder: (context, gameFlowState) {
            final gameState = context.read<GameBloc>().state;
            int exerciseIndex = 0;
            if (gameState is ExerciseNavigateState) {
              exerciseIndex = gameState.index;
            }

            if (gameFlowState is TimerRunningState) {
              return TimerScreen(
                secondsLeft: gameFlowState.secondsLeft,
                totalSeconds: 30,
                onStart: () {
                  // todo: add action
                },
                onPause: () {
                  // todo: add action
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
                          },
                        ),
                        SizedBox(height: 20.h),
                        IconButtonWidget(
                          iconAsset: AppAssets.iconBack,
                          onPressed: () {
                            context.router.maybePop();
                          },
                        ),
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
                      onExerciseSelected: (exerciseIndex) {
                        context.read<GameBloc>().add(
                          ExerciseSelectedEvent(exerciseIndex),
                        );
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
                          // context.read<GameFlowBloc>().add(ShowOverlayWowEvent());
                        },
                      ),
                    ),
                  ),

                  if (gameFlowState is OverlayWow)
                    WowOverlayWidget(index: exerciseIndex),
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

                  if (context.read<GameBloc>().state is ExerciseNavigateState)
                    ExerciseDetailsScreen(
                      index:
                          (context.read<GameBloc>().state
                                  as ExerciseNavigateState)
                              .index,
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
