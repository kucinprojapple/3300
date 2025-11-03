import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';
import '../profile_overlay_bloc/profile_overlay_bloc.dart';

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
          GestureDetector(
            onTap: () {
              context.read<ProfileOverlayBloc>().add(
                ShowMedalSelectOverlayEvent(),
              );
            },
            child: Image.asset(medalAsset, width: size.w, height: size.h),
          ),

          ClipOval(
            child: Image.file(
              File(avatarPicture),
              fit: BoxFit.cover,
              width: (size * 0.80).w,
              height: (size * 0.80).h,
            ),
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
