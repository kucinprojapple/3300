import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';
import '../../../app_core_design/colors.dart';
import '../../../app_core_design/text_styles.dart';
import '../../../app_core_design/texts.dart';
import '../../../core/services/vibration_service.dart';
import '../../../core/storage/local_storage_service.dart';
import '../../../core/widgets/action_button_widget.dart';
import '../../../core/widgets/custom_gradient_container_widget.dart';
import '../../../core/widgets/custom_snack_bar_widget.dart';
import '../../../core/widgets/icon_button_widget.dart';
import '../settings_cubit/settings_cubit.dart';
import '../widgets/settings_timer_selector.dart';
import '../widgets/switch_with_prefs_widget.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingsCubit(LocalStorageService()),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          final cubit = context.read<SettingsCubit>();

          return Scaffold(
            body: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    AppAssets.backgroundMain,
                    fit: BoxFit.fill,
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.viewPaddingOf(context).top + 12.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: CustomIconButtonWidget(
                            iconAsset: AppAssets.iconBack,
                            onPressed: () {
                              context.router.maybePop();
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      MainTextBody.gradientText(
                        context,
                        AppTexts.settings,
                        fontSize: 25.sp,
                        alignment: Alignment.bottomCenter,
                        useShadow: false,
                        height: 1.1,
                      ),
                      SizedBox(height: 72.h),
                      CustomGradientContainerWidget(
                        width: double.infinity,
                        height: 268.h,
                        backgroundGradient:
                            AppColors
                                .gradientColors
                                .containerGradientBrightGreen,
                        borderGradient:
                            AppColors.gradientColors.borderGradientBrightGreen,
                        borderWidth: 2.w,
                        borderRadius: 20.r,
                        child: Column(
                          children: [
                            SizedBox(height: 24.h),

                            SwitchWithPrefsWidget(
                              title: AppTexts.sound,
                              initialValue: state.sound,
                              onChanged: (value) async {
                                cubit.toggleSound(value);
                                if (value) {
                                  await VibrationService.mediumImpact();
                                }
                              },
                            ),
                            SizedBox(height: 20.h),

                            SwitchWithPrefsWidget(
                              title: AppTexts.music,
                              initialValue: state.music,
                              onChanged: (value) async {
                                cubit.toggleMusic(value);
                                if (value) {
                                  await VibrationService.mediumImpact();
                                }
                              },
                            ),
                            SizedBox(height: 20.h),

                            SwitchWithPrefsWidget(
                              title: AppTexts.vibration,
                              initialValue: state.vibration,
                              onChanged: (value) async {
                                cubit.toggleVibration(value);
                                if (value) {
                                  await VibrationService.mediumImpact();
                                }
                              },
                            ),
                            SizedBox(height: 40.h),

                            SettingsTimerSelector(
                              selectedTimer: state.timer,
                              onSelect: cubit.selectTimer,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 32.h),
                      ActionButtonWidget(
                        width: 200.w,
                        height: 80.h,
                        text: AppTexts.buttonSave,
                        fontSize: 24.sp,
                        onPressed: () async {
                          if (state.vibration) {
                            await VibrationService.lightImpact();
                          }
                          await cubit.save();

                          if (!context.mounted) return;
                          CustomSnackBar.show(
                            context,
                            AppTexts.snackBarSettingsSaved,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
