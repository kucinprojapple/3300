import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../../../app_core._design/assets.dart';
import '../../../app_core._design/styles.dart';
import '../../../core/widgets/action_button_widget.dart';
import '../../../core/widgets/icon_button_widget.dart';
import '../../../storage/local_storage_service.dart';
import '../widgets/custom_snack_bar_widget.dart';
import '../widgets/swirch_with_prefs_widget.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final storage = LocalStorageService();

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
            top: 49.h,
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
            left: 0,
            top: 120.h,
            right: 0,

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
              width: 333.05.w,
              height: 265.72.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                gradient: const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF389A07), // верх
                    Color(0xFF020500), // низ
                  ],
                ),
                border: GradientBoxBorder(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF969494), // верх рамки
                      Color(0xFF848484), // низ рамки
                    ],
                  ),
                  width: 4,
                ),
              ),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 32.h),

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
