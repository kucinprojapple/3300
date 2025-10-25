import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:green_gym_club/app_core._design/assets.dart';



class AvatarPickerWidget extends StatelessWidget {
  final String currentAvatar;
  final ValueChanged<String> onAvatarChanged;
  final double avatarSize;
  // final double buttonSize;
  // final double iconSize;

  const AvatarPickerWidget({
    super.key,
    required this.currentAvatar,
    required this.onAvatarChanged,
    this.avatarSize = 150,
    // this.buttonSize = 32,
    // this.iconSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      // mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(currentAvatar, height: avatarSize.h, width: avatarSize.w),
        // SizedBox(height: 4.h),

        Positioned(
          left: 60.w,
          bottom: 5.h,
          child: InkWell(
            onTap: () async {
              final avatars = [AppAssets.avatarMan, AppAssets.avatarWoman];

              final selected = await showDialog<String>(
                context: context,
                builder:
                    (context) => SimpleDialog(
                      title: const Text('Choose Avatar'),
                      children:
                          avatars.map((avatar) {
                            return SimpleDialogOption(
                              onPressed: () => Navigator.pop(context, avatar),
                              child: Row(
                                children: [
                                  Image.asset(avatar, height: 48.h, width: 48.w),
                                  SizedBox(width: 12.w),
                                  Text(avatar.split('/').last.split('.').first),
                                ],
                              ),
                            );
                          }).toList(),
                    ),
              );

              if (selected != null) {
                onAvatarChanged(selected);
              }
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
