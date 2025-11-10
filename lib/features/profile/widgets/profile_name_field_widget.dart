import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';
import '../../../app_core_design/text_styles.dart';

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
      width: 200.w,
      height: 42.h,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(3, 20, 0, 1),
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: const Color.fromRGBO(115, 112, 109, 1),
          width: 1.w,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
              child: TextField(
                controller: controller,
                readOnly: !isEditing,
                textAlign: TextAlign.center,
                style: MainTextBody.style(
                  fontSize: 25.sp,
                  color: Colors.white,
                  useShadow: false,
                ),
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
