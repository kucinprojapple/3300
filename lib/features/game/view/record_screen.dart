import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';
import '../../../app_core_design/colors.dart';
import '../../../app_core_design/styles.dart';
import '../../../app_core_design/texts.dart';
import '../../../core/storage/local_storage_service.dart';
import '../../../core/widgets/action_button_widget.dart';
import '../../../core/widgets/custom_gradient_container_widget.dart';
import '../../../core/widgets/icon_button_widget.dart';
import '../../../core/widgets/custom_snack_bar_widget.dart';
import '../../exercises/data/exercise_list.dart';
import '../../exercises/model/exercise_entity.dart';
import '../game_bloc/game_bloc.dart';
import '../game_bloc/game_event.dart';

@RoutePage()
class RecordScreen extends StatefulWidget {
  final int index;

  const RecordScreen({super.key, required this.index});

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  late TextEditingController _repsController;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _repsController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    _repsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ExerciseEntity exercise =
        exercisesData[widget.index.clamp(0, exercisesData.length - 1)];

    final storage = LocalStorageService();
    final exerciseTime = storage.timerDuration;
    final formattedTime = '00:${exerciseTime.toString().padLeft(2, '0')}';

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppAssets.backgroundMain, fit: BoxFit.fill),
          ),
          Positioned(
            top: 48.h,
            left: 30.w,
            child: IconButtonWidget(
              iconAsset: AppAssets.iconBack,
              onPressed: () => context.router.maybePop(),
            ),
          ),
          Positioned(
            left: 20.w,
            top: 200.h,
            right: 20.w,
            child: Column(
              children: [
                CustomGradientContainerWidget(
                  width: 322.w,
                  height: 248.h,
                  backgroundGradient:
                      AppColors.gradientColors.containerGradientDarkGreen,
                  borderGradient:
                      AppColors.gradientColors.borderGradientDarkGreen,
                  child: Column(
                    children: [
                      SizedBox(height: 4.h),
                      MainTextBody.gradientText(
                        context,
                        exercise.name,
                        size: TextSize.l,
                        alignment: Alignment.bottomCenter,
                        useShadow: false,
                        height: 1.1,
                      ),
                      SizedBox(height: 12.h),
                      Image.asset(exercise.image, height: 152.h),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),
                CustomGradientContainerWidget(
                  width: 332.w,
                  height: 60.h,
                  backgroundGradient:
                      AppColors.gradientColors.containerGradientDarkGreen,
                  borderGradient:
                      AppColors.gradientColors.borderGradientDarkGreen,
                  borderWidth: 2.w,
                  borderRadius: 20.r,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MainTextBody.gradientText(
                          context,
                          AppTexts.time,
                          size: TextSize.m,
                          alignment: Alignment.centerLeft,
                          useShadow: false,
                          height: 1.0,
                        ),
                        const Spacer(),
                        MainTextBody.gradientText(
                          context,
                          formattedTime,
                          size: TextSize.l,
                          alignment: Alignment.centerLeft,
                          useShadow: false,
                          height: 1.0,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                CustomGradientContainerWidget(
                  width: 332.w,
                  height: 60.h,
                  backgroundGradient:
                      AppColors.gradientColors.containerGradientDarkGreen,
                  borderGradient:
                      AppColors.gradientColors.borderGradientDarkGreen,
                  borderWidth: 2.w,
                  borderRadius: 20.r,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 8.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MainTextBody.gradientText(
                          context,
                          AppTexts.reps,
                          size: TextSize.m,
                          alignment: Alignment.centerLeft,
                          useShadow: false,
                          height: 1.0,
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 80.w,
                          child: TextField(
                            controller: _repsController,
                            enabled: _isEditing,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            style: AppTextStyles.mainTextBody(
                              context,
                            ).m.copyWith(color: Colors.white, shadows: []),

                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              isCollapsed: true,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isEditing = !_isEditing;
                            });
                          },
                          child: Opacity(
                            opacity: _isEditing ? 0.5 : 1.0,
                            child: Image.asset(
                              AppAssets.iconEdit,
                              width: 44.w,
                              height: 44.h,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0.w,
            bottom: 80.h,
            right: 0.w,
            child: Center(
              child: ActionButtonWidget(
                width: 224.w,
                height: 88.h,
                text: AppTexts.buttonSave,
                fontSize: 30.sp,
                onPressed: () async {
                  final exerciseName = exercise.name;
                  final exerciseTime = LocalStorageService().timerDuration;
                  final exerciseReps = int.tryParse(_repsController.text) ?? 0;

                  final bloc = context.read<GameBloc>();

                  CustomSnackBar.show(context, AppTexts.snackBarResultSaved);
                  await Future.delayed(const Duration(seconds: 3));

                  bloc.add(
                    SaveResultEvent(
                      exerciseName: exerciseName,
                      exerciseTime: exerciseTime,
                      exerciseReps: exerciseReps,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
