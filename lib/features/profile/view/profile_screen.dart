import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';
import '../../../app_core_design/text_styles.dart';
import '../../../app_core_design/texts.dart';
import '../../../core/constants/medal_assets_constants.dart';
import '../../../core/widgets/icon_button_widget.dart';
import '../profile_data_cubit/profile_data_cubit.dart';
import '../profile_data_cubit/profile_data_state.dart';
import '../profile_overlay_bloc/profile_overlay_bloc.dart';
import '../widgets/profile_achievements_card_widget.dart';
import '../widgets/profile_avatar_medal_widget.dart';
import '../widgets/profile_favorite_exercise_card_widget.dart';
import '../widgets/profile_name_field_widget.dart';
import '../widgets/profile_overlays.dart';
import '../widgets/profile_stats_row_widget.dart';
import '../widgets/profile_title_card_widget.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController usernameController;
  bool isEditingUsername = false;
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    final storage = context.read<ProfileDataCubit>().storage;
    usernameController = TextEditingController(text: storage.playerName);
    context.read<ProfileDataCubit>().loadProfile();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileDataCubit, ProfileDataState>(
      builder: (context, state) {
        final medalAsset =
            MedalAssetsConstants.all[state.selectedMedalIndex.clamp(
              0,
              MedalAssetsConstants.all.length - 1,
            )];

        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(AppAssets.backgroundMain, fit: BoxFit.fill),
              ),
              Positioned(
                left: 30.w,
                top: 48.h,
                child: CustomIconButtonWidget(
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
                      AppTexts.myAccount,
                      fontSize: 25.sp,
                      alignment: Alignment.bottomCenter,
                      useShadow: false,
                      height: 1.1,
                    ),
                    SizedBox(height: 12.h),
                    ProfileAvatarMedalWidget(
                      avatarPicture: state.avatar,
                      medalAsset: medalAsset,
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
                    ProfileNameFieldWidget(
                      controller: usernameController,
                      isEditing: isEditingUsername,
                      onEditPressed:
                          () => setState(() => isEditingUsername = true),
                      onChanged: (value) {
                        _debounce?.cancel();
                        _debounce = Timer(
                          const Duration(milliseconds: 500),
                          () => context.read<ProfileDataCubit>().updateName(
                            value,
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 12.h),
                    ProfileTitleCardWidget(state: state),
                    SizedBox(height: 20.h),
                    ProfileStatsRowWidget(state: state),
                    SizedBox(height: 20.h),
                    ProfileAchievementsCardWidget(state: state),
                    SizedBox(height: 12.h),
                    ProfileFavoriteExerciseCardWidget(state: state),
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
