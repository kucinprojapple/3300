import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../../../app_core_design/assets.dart';
import '../../../app_core_design/styles.dart';
import '../../../core/widgets/action_button_widget.dart';
import '../../../core/widgets/icon_button_widget.dart';
import '../../../storage/local_storage_service.dart';
import '../widgets/custom_snack_bar_widget.dart';
import '../widgets/swirch_with_prefs_widget.dart';
import '../widgets/timer_option_circle_widget.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final storage = LocalStorageService();
  int _selectedTimerSeconds = 30;
  final List<int> _timerOptions = [30, 60, 90, 120];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppAssets.backgroundMain, fit: BoxFit.fill),
          ),

          Positioned(
            left: 30.w,
            top: 48.h,
            child: Column(
              children: [
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
            left: 0.w,
            top: 120.h,
            right: 0.w,
            child: NumbersTextBody.gradientNumbers(
              context,
              'Settings',
              size: TextSize.m,
              alignment: Alignment.bottomCenter,
              useShadow: false,
              height: 1.1,
            ),
          ),

          Positioned(
            left: 28.w,
            top: 226.h,
            child: Container(
              width: 332.w,
              height: 268.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF389A07),
                    Color(0xFF020500),
                  ],
                ),
                border: GradientBoxBorder(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF969494), Color(0xFF848484)],
                  ),
                  width: 4.w,
                ),
              ),

              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 24.h),

                  SwitchWithPrefsWidget(
                    title: "Sound",
                    initialValue: storage.soundEnabled,
                    onChanged: (val) => storage.soundEnabled = val,
                  ),
                  SizedBox(height: 20.h),
                  SwitchWithPrefsWidget(
                    title: "Music",
                    initialValue: storage.notificationsEnabled,
                    onChanged: (val) => storage.notificationsEnabled = val,
                  ),
                  SizedBox(height: 20.h),
                  SwitchWithPrefsWidget(
                    title: "Vibration",
                    initialValue: storage.vibrationEnabled,
                    onChanged: (val) => storage.vibrationEnabled = val,
                  ),
                  SizedBox(height: 40.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NumbersTextBody.gradientNumbers(
                          context,
                          'Timer',
                          size: TextSize.m,
                          alignment: Alignment.centerLeft,
                          useShadow: false,
                          height: 1.1,
                        ),
                        SizedBox(width: 36.w),
                        Expanded(
                          child: Row(
                            children: _timerOptions.map((seconds) {
                              return TimerOptionCircleWidget(
                                seconds: seconds,
                                isSelected: _selectedTimerSeconds == seconds,
                                onTap: () {
                                  setState(() {
                                    _selectedTimerSeconds = seconds;
                                  });
                                },
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            left: 0,
            bottom: 181.h,
            right: 0,
            child: Center(
              child: ActionButtonWidget(
                width: 227.w,
                height: 89.h,
                text: 'Save',
                fontSize: 30.sp,
                onPressed: () {
                  CustomSnackBar.show(context, 'Settings saved');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
