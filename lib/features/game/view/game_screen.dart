import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_gym_club/features/game/game_bloc/game_bloc.dart';

import '../../../app_core_design/assets.dart';
import '../../../core/widgets/action_button_widget.dart';
import '../../../core/widgets/icon_button_widget.dart';
import '../../../router/router.dart';
import '../game_bloc/game_event.dart';
import '../game_bloc/game_state.dart';
import '../widgets/exercise_details_screen.dart';
import '../widgets/exercise_grid_widget.dart';

@RoutePage()
class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GameBloc(),
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
        child: BlocBuilder<GameBloc, GameState>(
          builder: (context, state) {
            return Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    AppAssets.backgroundMain,
                    fit: BoxFit.fill,
                  ),
                ),

                Positioned(
                  left: 30.w,
                  top: 49.h,
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
                        // todo: add action
                      },
                    ),
                  ),
                ),

                if (state is ExerciseNavigateState)
                  ExerciseDetailsScreen(index: state.index),
              ],
            );
          },
        ),
      ),
    );
  }
}
