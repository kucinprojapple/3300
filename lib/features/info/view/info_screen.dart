import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';
import '../../../app_core_design/text_styles.dart';
import '../../../app_core_design/texts.dart';
import '../../../core/widgets/icon_button_widget.dart';

@RoutePage()
class InfoScreen extends StatelessWidget {
  const InfoScreen({super.key});

  Widget _buildParagraphRow(BuildContext context, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: MainTextBody.gradientText(
            context,
            text,
            fontSize: 20.sp,
            useShadow: false,
            height: 1.1,
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final paragraphs = [
      AppTexts.infoGuideP1,
      AppTexts.infoGuideP2,
      AppTexts.infoGuideP3,
      AppTexts.infoGuideP4,
      AppTexts.infoGuideP5,
      AppTexts.infoGuideP6,
    ];

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
                CustomIconButtonWidget(
                  iconAsset: AppAssets.iconBack,
                  onPressed: () {
                    AutoRouter.of(context).maybePop();
                  },
                ),
              ],
            ),
          ),
          Positioned(
            left: 0.w,
            top: 120.h,
            right: 0.w,
            child: MainTextBody.gradientText(
              context,
              AppTexts.info,
              fontSize: 25.sp,
              alignment: Alignment.bottomCenter,
              useShadow: false,
              height: 1.1,
            ),
          ),
          Positioned(
            left: 0.w,
            top: 180.h,
            right: 0.w,
            bottom: 20.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var paragraph in paragraphs) ...[
                      _buildParagraphRow(context, paragraph),
                      SizedBox(height: 12.h),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}