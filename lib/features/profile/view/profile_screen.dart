import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';
import '../../../app_core_design/styles.dart';
import '../../../core/widgets/custom_gradient_container_widget.dart';
import '../../../core/widgets/icon_button_widget.dart';
import '../profile_data_cubit/profile_data_cubit.dart';
import '../profile_data_cubit/profile_data_state.dart';
import '../profile_overlay_bloc/profile_overlay_bloc.dart';
import '../widgets/profile_avatar_medal_widget.dart';
import '../widgets/profile_overlays.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController usernameController;
  bool isEditingUsername = false;

  @override
  void initState() {
    super.initState();
    final storage = context.read<ProfileDataCubit>().storage;
    usernameController = TextEditingController(text: storage.playerName);
  }

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileDataCubit, ProfileDataState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(AppAssets.backgroundMain, fit: BoxFit.fill),
              ),
              Positioned(
                left: 30.w,
                top: 48.h,
                child: IconButtonWidget(
                  iconAsset: AppAssets.iconBack,
                  onPressed: () {
                    context.router.maybePop();
                  },
                ),
              ),
              Positioned(
                left: 0.w,
                top: 120.h,
                right: 0.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MainTextBody.gradientText(
                      context,
                      'My Account',
                      size: TextSize.m,
                      alignment: Alignment.bottomCenter,
                      useShadow: false,
                      height: 1.1,
                    ),
                    SizedBox(height: 12.h),
                    ProfileAvatarMedalWidget(
                      avatarPicture: state.avatar,
                      medalAsset: AppAssets.achievementMedal_8,
                      onAddPressed:
                          () => context.read<ProfileOverlayBloc>().add(
                            ShowSelectPictureOverlayEvent(),
                          ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0.w,
                top: 324.h,
                right: 0.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // === USERNAME FIELD ===
                    Container(
                      height: 42.h,
                      margin: EdgeInsets.symmetric(horizontal: 94.w),
                      decoration: BoxDecoration(
                        color: const Color(0xFF031400),
                        borderRadius: BorderRadius.circular(24.r),
                        border: Border.all(
                          color: const Color(0xFF73706D),
                          width: 1.5.w,
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Center(
                            child: SizedBox(
                              width: double.infinity,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.w),
                                child: TextField(
                                  controller: usernameController,
                                  readOnly: !isEditingUsername,
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.mainTextBody(
                                    context,
                                  ).m.copyWith(
                                    color: Colors.white,
                                    shadows: [],
                                  ),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(
                                      vertical: 8.h,
                                    ),
                                  ),
                                  onSubmitted: (value) {
                                    context.read<ProfileDataCubit>().updateName(
                                      value,
                                    );
                                    setState(() {
                                      isEditingUsername = false;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 4.w,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isEditingUsername = true;
                                });
                              },
                              child: Image.asset(
                                AppAssets.iconEdit,
                                width: 30.w,
                                height: 30.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.h),
                    // === TITLE FIELD ===
                    CustomGradientContainerWidget(
                      width: 336.w,
                      height: 48.h,
                      backgroundGradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFF389A07), Color(0xFF020500)],
                      ),
                      borderGradient: const LinearGradient(
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
                              size: TextSize.m,
                              alignment: Alignment.centerLeft,
                              useGradient: false,
                              useShadow: false,
                              height: 1.0,
                            ),
                            Expanded(
                              child: MainTextBody.gradientText(
                                context,
                                state.title,
                                alignment: Alignment.center,
                                useGradient: false,
                                useShadow: false,
                                height: 1.0,
                                fontSize: 20.sp,
                              ),
                            ),
                            GestureDetector(
                              onTap:
                                  () => context.read<ProfileOverlayBloc>().add(
                                    ShowTitleSelectOverlayEvent(),
                                  ),
                              child: Image.asset(
                                AppAssets.iconEdit,
                                width: 30.w,
                                height: 30.h,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
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
                                padding: EdgeInsets.only(
                                  top: 8.h,
                                  bottom: 12.h,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MainTextBody.gradientText(
                                      context,
                                      'NUMBER OF \nEXERCISES \nPERFORMED',
                                      size: TextSize.xs,
                                      alignment: Alignment.topCenter,
                                      useGradient: false,
                                      useShadow: false,
                                      height: 1.0,
                                      fontSize: 12.sp,
                                    ),
                                    Spacer(),
                                    MainTextBody.gradientText(
                                      context,
                                      '25',
                                      alignment: Alignment.topCenter,
                                      useGradient: false,
                                      useShadow: false,
                                      height: 1.0,
                                      fontSize: 30.sp,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 4.w),
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
                                padding: EdgeInsets.only(
                                  top: 8.h,
                                  bottom: 12.h,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MainTextBody.gradientText(
                                      context,
                                      'AMOUNT OF \nTIMER FOR \nEXERCISE',
                                      size: TextSize.xs,
                                      alignment: Alignment.topCenter,
                                      useGradient: false,
                                      useShadow: false,
                                      height: 1.0,
                                      fontSize: 12.sp,
                                    ),
                                    Spacer(),
                                    MainTextBody.gradientText(
                                      context,
                                      '0:30',
                                      alignment: Alignment.topCenter,
                                      useGradient: false,
                                      useShadow: false,
                                      height: 1.0,
                                      fontSize: 30.sp,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 4.w),
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
                                padding: EdgeInsets.only(
                                  top: 8.h,
                                  bottom: 12.h,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MainTextBody.gradientText(
                                      context,
                                      'NUMBER OF \nREPETITION',
                                      size: TextSize.xs,
                                      alignment: Alignment.topCenter,
                                      useGradient: false,
                                      useShadow: false,
                                      height: 1.0,
                                      fontSize: 12.sp,
                                    ),
                                    Spacer(),
                                    MainTextBody.gradientText(
                                      context,
                                      '300',
                                      alignment: Alignment.topCenter,
                                      useGradient: false,
                                      useShadow: false,
                                      height: 1.0,
                                      fontSize: 30.sp,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    CustomGradientContainerWidget(
                      width: 354.w,
                      height: 54.h,
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
                              'ACHIEVEMENTS',
                              size: TextSize.xs,
                              alignment: Alignment.centerLeft,
                              useGradient: false,
                              useShadow: false,
                              height: 1.0,
                            ),
                            MainTextBody.gradientText(
                              context,
                              '3 | 20',
                              size: TextSize.s,
                              alignment: Alignment.centerLeft,
                              useGradient: false,
                              useShadow: false,
                              height: 1.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    CustomGradientContainerWidget(
                      width: 354.w,
                      height: 54.h,
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
                              'FAVORITE EXERCISE',
                              size: TextSize.xs,
                              alignment: Alignment.centerLeft,
                              useGradient: false,
                              useShadow: false,
                              height: 1.0,
                            ),
                            MainTextBody.gradientText(
                              context,
                              'Push-Ups',
                              size: TextSize.s,
                              alignment: Alignment.centerLeft,
                              useGradient: false,
                              useShadow: false,
                              height: 1.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned.fill(child: ProfileOverlays()),
            ],
          ),
        );
      },
    );
  }
}
