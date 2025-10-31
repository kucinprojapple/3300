import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';
import '../../../app_core_design/styles.dart';
import '../../../core/widgets/custom_gradient_container_widget.dart';

class OnboardingStep4Widget extends StatelessWidget {
  const OnboardingStep4Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 12.h),
          Stack(
            children: [
              Image.asset(AppAssets.avatarWoman, height: 80.h),
              Positioned(
                left: 30.w,
                top: 62.h,
                child: Image.asset(AppAssets.iconAdd, height: 20.h),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Container(
            width: 120.w,
            height: 25.h,
            decoration: BoxDecoration(
              color: Color(0xFF031400),
              borderRadius: BorderRadius.circular(24.r),
              border: Border.all(color: const Color(0xFF73706D), width: 1.5.w),
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Text('')),
                Padding(
                  padding: EdgeInsets.only(right: 4.w),
                  child: Image.asset(
                    AppAssets.iconEdit,
                    width: 22.w,
                    height: 22.h,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
          CustomGradientContainerWidget(
            width: 204.w,
            height: 28.h,
            backgroundGradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF389A07), Color(0xFF020500)],
            ),
            borderGradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF1E1E1E), Color(0xFF848484)],
            ),
            borderWidth: 1.5,
            borderRadius: 12.r,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MainTextBody.gradientText(
                    context,
                    'TITLE:',
                    alignment: Alignment.centerLeft,
                    useGradient: false,
                    useShadow: false,
                    height: 1.0,
                    fontSize: 14.sp,
                  ),
                  MainTextBody.gradientText(
                    context,
                    'Push-Up King',
                    size: TextSize.xs,
                    alignment: Alignment.centerLeft,
                    useGradient: false,
                    useShadow: false,
                    height: 1.0,
                    fontSize: 11.sp,
                  ),
                  Image.asset(AppAssets.iconEdit, width: 22.w, height: 22.h),
                ],
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Row(
              children: [
                Expanded(
                  child: CustomGradientContainerWidget(
                    width: 60.w,
                    height: 80.h,
                    backgroundGradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF389A07), Color(0xFF020500)],
                    ),
                    borderGradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF1E1E1E), Color(0xFF848484)],
                    ),
                    borderWidth: 1.5,
                    borderRadius: 12.r,
                    child: Padding(
                      padding: EdgeInsets.only(top: 4.h, bottom: 8.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MainTextBody.gradientText(
                            context,
                            'NUMBER OF \nEXERCISES \nPERFORMED',
                            size: TextSize.xs,
                            alignment: Alignment.topCenter,
                            useGradient: false,
                            useShadow: false,
                            height: 1.0,
                            fontSize: 6.sp,
                          ),
                          Spacer(),
                          MainTextBody.gradientText(
                            context,
                            '25',
                            alignment: Alignment.topCenter,
                            useGradient: false,
                            useShadow: false,
                            height: 1.0,
                            fontSize: 20.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: CustomGradientContainerWidget(
                    width: 68.w,
                    height: 80.h,
                    backgroundGradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF389A07), Color(0xFF020500)],
                    ),
                    borderGradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF1E1E1E), Color(0xFF848484)],
                    ),
                    borderWidth: 1.5,
                    borderRadius: 12.r,
                    child: Padding(
                      padding: EdgeInsets.only(top: 4.h, bottom: 8.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MainTextBody.gradientText(
                            context,
                            'AMOUNT OF \nTIMER FOR \nEXERCISE',
                            size: TextSize.xs,
                            alignment: Alignment.topCenter,
                            useGradient: false,
                            useShadow: false,
                            height: 1.0,
                            fontSize: 6.sp,
                          ),
                          Spacer(),
                          MainTextBody.gradientText(
                            context,
                            '0:30',
                            alignment: Alignment.topCenter,
                            useGradient: false,
                            useShadow: false,
                            height: 1.0,
                            fontSize: 20.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: CustomGradientContainerWidget(
                    width: 68.w,
                    height: 80.h,
                    backgroundGradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF389A07), Color(0xFF020500)],
                    ),
                    borderGradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF1E1E1E), Color(0xFF848484)],
                    ),
                    borderRadius: 12.r,
                    borderWidth: 1.5,
                    child: Padding(
                      padding: EdgeInsets.only(top: 4.h, bottom: 8.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MainTextBody.gradientText(
                            context,
                            'NUMBER OF \nREPETITION',
                            size: TextSize.xs,
                            alignment: Alignment.topCenter,
                            useGradient: false,
                            useShadow: false,
                            height: 1.0,
                            fontSize: 6.sp,
                          ),
                          Spacer(),
                          MainTextBody.gradientText(
                            context,
                            '300',
                            alignment: Alignment.topCenter,
                            useGradient: false,
                            useShadow: false,
                            height: 1.0,
                            fontSize: 20.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
