import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';
import '../../../app_core_design/colors.dart';
import '../../../app_core_design/text_styles.dart';
import '../../../app_core_design/texts.dart';
import '../../../core/storage/local_storage_service.dart';
import '../../../core/widgets/action_button_widget.dart';
import '../../../core/widgets/custom_gradient_container_widget.dart';
import '../../../core/widgets/custom_snack_bar_widget.dart';
import '../../../core/widgets/icon_button_widget.dart';
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
  late FocusNode _repsFocusNode;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _repsController = TextEditingController(text: '');
    _repsFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _repsController.dispose();
    _repsFocusNode.dispose();
    super.dispose();
  }

  void _startEditing() {
    setState(() {
      _isEditing = true;
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _repsFocusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final ExerciseEntity exercise =
        exercisesData[widget.index.clamp(0, exercisesData.length - 1)];

    final storage = LocalStorageService();
    final exerciseTime = storage.timerDuration;
    final formattedTime = '00:${exerciseTime.toString().padLeft(2, '0')}';

    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(AppAssets.backgroundMain, fit: BoxFit.fill),
        ),
        Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
            ).copyWith(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.viewPaddingOf(context).top + 12.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4.w),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: CustomIconButtonWidget(
                        iconAsset: AppAssets.iconBack,
                        onPressed: () => context.router.maybePop(),
                      ),
                    ),
                  ),
                  SizedBox(height: 92.h),
                  CustomGradientContainerWidget(
                    width: double.infinity,
                    height: 248.h,
                    backgroundGradient:
                        AppColors.gradientColors.containerGradientDarkGreen,
                    borderGradient:
                        AppColors.gradientColors.borderGradientDarkGreen,
                    borderWidth: 2.w,
                    borderRadius: 20.r,
                    child: Padding(
                      padding: EdgeInsets.all(4.h),
                      child: Column(
                        children: [
                          MainTextBody.gradientText(
                            context,
                            exercise.name,
                            fontSize: 30.sp,
                            alignment: Alignment.bottomCenter,
                            useShadow: false,
                            height: 1.1,
                          ),
                          SizedBox(height: 12.h),
                          // Spacer(),
                          Padding(
                            padding: EdgeInsets.only(bottom: 8.h),
                            child: Image.asset(
                              exercise.image,
                              height: 160.h,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CustomGradientContainerWidget(
                    width: double.infinity,
                    height: 60.h,
                    backgroundGradient:
                        AppColors.gradientColors.containerGradientDarkGreen,
                    borderGradient:
                        AppColors.gradientColors.borderGradientDarkGreen,
                    borderWidth: 2.w,
                    borderRadius: 20.r,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 72.w),
                      child: Row(
                        children: [
                          MainTextBody.gradientText(
                            context,
                            AppTexts.time,
                            fontSize: 25.sp,
                            alignment: Alignment.centerLeft,
                            useShadow: false,
                            height: 1.0,
                          ),
                          Spacer(),
                          MainTextBody.gradientText(
                            context,
                            formattedTime,
                            fontSize: 30.sp,
                            alignment: Alignment.centerRight,
                            useShadow: false,
                            height: 1.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  CustomGradientContainerWidget(
                    width: double.infinity,
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
                            fontSize: 25.sp,
                            alignment: Alignment.centerLeft,
                            useShadow: false,
                            height: 1.0,
                          ),
                          Spacer(),
                          Container(
                            width: 48.w,
                            alignment: Alignment.centerRight,
                            child: TextField(
                              controller: _repsController,
                              focusNode: _repsFocusNode,
                              enabled: _isEditing,
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              style: MainTextBody.style().copyWith(
                                color: Colors.white,
                                fontSize: 30.sp,
                                shadows: [],
                              ),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                isCollapsed: true,
                                contentPadding: EdgeInsets.zero,
                              ),
                              // onTap: _startEditing,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          GestureDetector(
                            onTap: _isEditing ? null : _startEditing,
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
                  SizedBox(height: 20.h),
                  ActionButtonWidget(
                    width: 200.w,
                    height: 80.h,
                    text: AppTexts.buttonSave,
                    fontSize: 30.sp,
                    onPressed: () async {
                      final exerciseName = exercise.name;
                      final exerciseTime = LocalStorageService().timerDuration;
                      final exerciseReps =
                          int.tryParse(_repsController.text) ?? 0;

                      final bloc = context.read<GameBloc>();

                      CustomSnackBar.show(
                        context,
                        AppTexts.snackBarResultSaved,
                      );
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
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
