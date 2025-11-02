import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';

class ProfileAvatarMedalWidget extends StatelessWidget {
  final String avatarPicture;
  final String medalAsset;
  final VoidCallback onAddPressed;

  const ProfileAvatarMedalWidget({
    super.key,
    required this.avatarPicture,
    required this.medalAsset,
    required this.onAddPressed,
  });

  @override
  Widget build(BuildContext context) {
    final double size = 160;
    return SizedBox(
      width: size.w,
      height: size.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(medalAsset, width: size.w, height: size.h),

          ClipOval(
            child:
            Image.file(
              File(avatarPicture),
              fit: BoxFit.cover,
              width: (size * 0.82).w,
              height: (size * 0.82).h,
            )
            // Image.asset(
            //   avatarPicture,
            //   width: (size * 0.8).w,
            //   height: (size * 0.8).h,
            //   fit: BoxFit.cover,
            // ),
          ),

          Positioned(
            bottom: 0.h,
            child: InkWell(
              onTap: onAddPressed,
              child: Image.asset(AppAssets.iconAdd, width: 32.w, height: 32.h),
            ),
          ),
        ],
      ),
    );
  }
}
