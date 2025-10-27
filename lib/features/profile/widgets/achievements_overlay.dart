import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../app_core_design/assets.dart';
import '../../../app_core_design/styles.dart';
import '../../game/widgets/custom_gradient_container_widget.dart';
import '../profile_bloc/profile_bloc.dart';

class AchievementsOverlay extends StatelessWidget {
  const AchievementsOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: double.infinity,
        height: 280.h,
        decoration: const BoxDecoration(color: Color(0xFF000000)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                children: [
                  Expanded(
                    child: CustomGradientContainerWidget(
                      width: 114.w,
                      height: 132.h,
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
                        padding: EdgeInsets.only(top: 8.h),
                        child: NumbersTextBody.gradientNumbers(
                          context,
                          'NUMBER OF \nEXERCISES \nPERFORMED',
                          size: TextSize.xs,
                          alignment: Alignment.topCenter,
                          useGradient: false,
                          useShadow: false,
                          height: 1.0,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: CustomGradientContainerWidget(
                      width: 114.w,
                      height: 132.h,
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
                        padding: EdgeInsets.only(top: 8.h),
                        child: NumbersTextBody.gradientNumbers(
                          context,
                          'AMOUNT OF \nTIMER FOR \nEXERCISE',
                          size: TextSize.xs,
                          alignment: Alignment.topCenter,
                          useGradient: false,
                          useShadow: false,
                          height: 1.0,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: CustomGradientContainerWidget(
                      width: 114.w,
                      height: 132.h,
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
                        padding: EdgeInsets.only(top: 8.h),
                        child: NumbersTextBody.gradientNumbers(
                          context,
                          'NUMBER OF \nREPETITION',
                          size: TextSize.xs,
                          alignment: Alignment.topCenter,
                          useGradient: false,
                          useShadow: false,
                          height: 1.0,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              child: SizedBox(
                width: 340.w,
                height: 48.h,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      AppAssets.backgroundCancel,
                      width: 340.w,
                      height: 48.h,
                      fit: BoxFit.cover,
                    ),
                    Text(
                      'Cancel',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 19.sp,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                context.read<ProfileOverlayBloc>().add(HideOverlayEvent());
              },
            ),
          ],
        ),
      ),
    );
  }
}
