import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/colors.dart';
import '../../../app_core_design/texts.dart';
import '../../../core/constants/medal_assets_constants.dart';
import '../../../core/widgets/action_button_widget.dart';
import '../../../core/widgets/custom_gradient_container_widget.dart';
import '../profile_data_cubit/profile_data_cubit.dart';
import '../profile_overlay_bloc/profile_overlay_bloc.dart';

class SelectMedalOverlay extends StatelessWidget {
  final int userAchievementsCount;
  final int selectedMedalIndex;

  const SelectMedalOverlay({
    super.key,
    required this.userAchievementsCount,
    required this.selectedMedalIndex,
  });

  @override
  Widget build(BuildContext context) {
    final int availableMedals = (userAchievementsCount ~/ 2) + 1;
    final medalAssets = MedalAssetsConstants.all;

    return Material(
      color: Colors.transparent,
      child: Stack(
        children: [
          Positioned(
            left: 12.w,
            top: 320.h,
            right: 12.w,
            child: Center(
              child: CustomGradientContainerWidget(
                width: 332.w,
                height: 300.h,
                backgroundGradient:
                    AppColors.gradientColors.containerGradientBrightGreen,
                borderGradient:
                    AppColors.gradientColors.borderGradientBrightGreen,
                borderWidth: 1.5.w,
                borderRadius: 12.r,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 8.h,
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (rowIndex) {
                        final start = rowIndex * 2;
                        final end = (start + 2).clamp(0, medalAssets.length);
                        final rowMedals = medalAssets.sublist(start, end);

                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: rowIndex < 4 ? 12.h : 0.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(rowMedals.length, (
                              indexInRow,
                            ) {
                              final index = start + indexInRow;
                              final isAvailable = index < availableMedals;
                              final isSelected = index == selectedMedalIndex;

                              return Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(
                                    right:
                                        index < medalAssets.length - 1
                                            ? 8.w
                                            : 0.w,
                                  ),
                                  child: CustomGradientContainerWidget(
                                    width: 114.w,
                                    height: 132.h,
                                    backgroundGradient:
                                        AppColors
                                            .gradientColors
                                            .containerGradientBrightGreen,
                                    borderGradient:
                                        AppColors
                                            .gradientColors
                                            .borderGradientBrightGreen,
                                    borderWidth: 1.w,
                                    borderRadius: 12.r,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 8.h),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap:
                                                isAvailable
                                                    ? () {
                                                      context
                                                          .read<
                                                            ProfileDataCubit
                                                          >()
                                                          .updateSelectedMedalIndex(
                                                            index,
                                                          );
                                                    }
                                                    : null,
                                            child: Image.asset(
                                              medalAssets[index],
                                              width: 72.w,
                                              height: 72.h,
                                              colorBlendMode:
                                                  isAvailable
                                                      ? null
                                                      : BlendMode.saturation,
                                            ),
                                          ),
                                          SizedBox(height: 8.h),
                                          ActionButtonWidget(
                                            width: 100.w,
                                            height: 32.h,
                                            text:
                                                isAvailable
                                                    ? (isSelected
                                                        ? AppTexts
                                                            .buttonSelected
                                                        : AppTexts
                                                            .buttonAvailable)
                                                    : AppTexts
                                                        .buttonUnavailable,

                                            fontSize: 12.sp,
                                            onPressed: () {
                                              if (!isAvailable) return;
                                              if (isSelected) {
                                                context
                                                    .read<ProfileOverlayBloc>()
                                                    .add(HideOverlayEvent());
                                              } else {
                                                context
                                                    .read<ProfileDataCubit>()
                                                    .updateSelectedMedalIndex(
                                                      index,
                                                    );
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
