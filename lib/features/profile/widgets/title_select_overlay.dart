import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';
import '../../../app_core_design/colors.dart';
import '../../../app_core_design/text_styles.dart';
import '../../../app_core_design/texts.dart';
import '../../../core/widgets/action_button_widget.dart';
import '../../../core/widgets/custom_gradient_container_widget.dart';
import '../../../core/widgets/custom_snack_bar_widget.dart';
import '../data/titles_list.dart';
import '../profile_data_cubit/profile_data_cubit.dart';
import '../profile_overlay_bloc/profile_overlay_bloc.dart';

class TitleSelectOverlay extends StatefulWidget {
  const TitleSelectOverlay({super.key});

  @override
  State<TitleSelectOverlay> createState() => _TitleSelectOverlayState();
}

class _TitleSelectOverlayState extends State<TitleSelectOverlay> {
  String? selectedTitle;

  @override
  void initState() {
    super.initState();

    final currentTitle = context.read<ProfileDataCubit>().state.title;
    selectedTitle = currentTitle;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        width: double.infinity,
        height: 388.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: CustomGradientContainerWidget(
                width: 310.w,
                height: 132.h,
                backgroundGradient:
                AppColors.gradientColors.containerGradientBrightGreen,
                borderGradient:
                AppColors.gradientColors.borderGradientBrightGreen,
                borderWidth: 1.w,
                borderRadius: 12.r,
                child: SizedBox(
                  height: 132.h,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: profileTitles.length,
                    itemBuilder: (context, index) {
                      final title = profileTitles[index];
                      final isSelected = selectedTitle == title;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTitle = title;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 5.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MainTextBody.gradientText(
                                context,
                                title,
                                alignment: Alignment.centerLeft,
                                useGradient: false,
                                useShadow: false,
                                height: 1.0,
                                fontSize: 18.sp,
                              ),
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Image.asset(
                                    AppAssets.achievementContainerEmpty,
                                    width: 32.w,
                                    height: 32.h,
                                  ),
                                  if (isSelected)
                                    Positioned(
                                      left: 4.w,
                                      child: Image.asset(
                                        AppAssets.achievementContainerDone,
                                        width: 34.w,
                                        height: 30.h,
                                      ),
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 32.h),
            ActionButtonWidget(
              width: 227.w,
              height: 89.h,
              text: 'Save',
              fontSize: 30.sp,
              onPressed: () async {
                if (selectedTitle != null) {
                  final title = selectedTitle!;
                  final overlayBloc = context.read<ProfileOverlayBloc>();
                  context.read<ProfileDataCubit>().updateTitle(title);
                  CustomSnackBar.show(context, AppTexts.snackBarTitleSaved);

                  await Future.delayed(const Duration(seconds: 3));

                  if (!mounted) return;
                  overlayBloc.add(HideOverlayEvent());
                } else {
                  CustomSnackBar.show(context, 'Please select a title');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
