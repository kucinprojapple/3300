import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_gym_club/background.dart';

import '../../../app_core_design/assets.dart';
import '../../../app_core_design/colors.dart';
import '../../../app_core_design/text_styles.dart';
import '../../../app_core_design/texts.dart';
import '../../../core/widgets/custom_gradient_container_widget.dart';

@RoutePage()
class LostNetworkScreen extends StatelessWidget {
  const LostNetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: AppMainBackground(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.viewPaddingOf(context).top + 12.h),
                // Padding(
                //   padding: EdgeInsets.only(left: 8.w),
                //   child: Align(
                //     alignment: Alignment.centerLeft,
                //     child: CustomIconButtonWidget(
                //       iconAsset: AppAssets.iconBack,
                //       onPressed: () {
                //         context.router.maybePop();
                //       },
                //     ),
                //   ),
                // ),
                SizedBox(height: 200.h),
                CustomGradientContainerWidget(
                  width: 322.w,
                  height: 300.h,
                  backgroundGradient:
                      AppColors.gradientColors.containerGradientDarkGreen,
                  borderGradient:
                      AppColors.gradientColors.borderGradientDarkGreen,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 12.h),
                      MainTextBody.gradientText(
                        context,
                        AppTexts.lostNetwork,
                        fontSize: 30.sp,
                        alignment: Alignment.center,
                        height: 1.1,
                      ),
                      SizedBox(height: 32.h),
                      Image.asset(
                        AppAssets.lostNetwork,
                        width: 220.w,
                        height: 180.h,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
