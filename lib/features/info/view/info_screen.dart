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

    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(AppAssets.backgroundMain, fit: BoxFit.fill),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SingleChildScrollView(
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
                    AppTexts.info,
                    fontSize: 25.sp,
                    alignment: Alignment.bottomCenter,
                    useShadow: false,
                    height: 1.1,
                  ),
                  SizedBox(height: 32.h),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
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
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
