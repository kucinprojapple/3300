import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';
import '../../../app_core_design/styles.dart';

class ProfileNameFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool isEditing;
  final VoidCallback onEditPressed;
  final ValueChanged<String> onChanged;

  const ProfileNameFieldWidget({
    super.key,
    required this.controller,
    required this.isEditing,
    required this.onEditPressed,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      margin: EdgeInsets.symmetric(horizontal: 94.w),
      decoration: BoxDecoration(
        color: const Color(0xFF031400),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(color: const Color(0xFF73706D), width: 1.5.w),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: TextField(
                controller: controller,
                readOnly: !isEditing,
                textAlign: TextAlign.center,
                style: AppTextStyles.mainTextBody(
                  context,
                ).m.copyWith(color: Colors.white, shadows: []),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 8.h),
                ),
                onChanged: onChanged,
              ),
            ),
          ),
          Positioned(
            right: 4.w,
            child: GestureDetector(
              onTap: onEditPressed,
              child: Image.asset(AppAssets.iconEdit, width: 30.w, height: 30.h),
            ),
          ),
        ],
      ),
    );
  }
}
