import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:green_gym_club/app_core_design/assets.dart';

import '../profile_bloc/profile_bloc.dart';

class AvatarPickerWidget extends StatelessWidget {
  final String currentAvatar;
  final ValueChanged<String> onAvatarChanged;
  final double avatarSize;



  const AvatarPickerWidget({
    super.key,
    required this.currentAvatar,
    required this.onAvatarChanged,
    this.avatarSize = 150,

  });

  @override
  Widget build(BuildContext context) {
    return Stack(

      children: [
        Image.asset(currentAvatar, height: avatarSize.h, width: avatarSize.w),


        Positioned(
          left: 60.w,
          bottom: 5.h,
          child: InkWell(
            onTap: () {
              context.read<ProfileOverlayBloc>().add(
                ShowSelectPictureOverlayEvent(),
              );
            },
            child: Image.asset(
              AppAssets.iconAdd,
              // height: 40.w,
              // width: 30.h,
            ),

            // Container(
            //   height: buttonSize.h,
            //   width: buttonSize.w,
            //   decoration: BoxDecoration(
            //     gradient: const LinearGradient(
            //       colors: [Color(0xFF1BC440), Color(0xFF43B805)],
            //       begin: Alignment.topCenter,
            //       end: Alignment.bottomCenter,
            //     ),
            //     borderRadius: BorderRadius.circular(8.r),
            //   ),
            //   child: Center(
            //     child: Image.asset(
            //       AppAssets.iconEdit,
            //       height: iconSize.h,
            //       width: iconSize.w,
            //     ),
            //   ),
            // ),
          ),
        ),
      ],
    );
  }
}
