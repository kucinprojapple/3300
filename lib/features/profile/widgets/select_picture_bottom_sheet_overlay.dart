import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../../../app_core_design/assets.dart';
import '../profile_overlay_bloc/profile_overlay_bloc.dart';
import '../profile_data_cubit/profile_data_cubit.dart';

class SelectPictureBottomSheetOverlay extends StatelessWidget {
  const SelectPictureBottomSheetOverlay({super.key});

  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      // Сохраняем путь к файлу в cubit
      context.read<ProfileDataCubit>().updateAvatar(pickedFile.path);

      // Прячем оверлей
      context.read<ProfileOverlayBloc>().add(HideOverlayEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(9.r)),
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: double.infinity,
          height: 280.h,
          decoration: const BoxDecoration(color: Color(0xFF000000)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 28.h),
              Text(
                'Please make your choice',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20.h),
              Divider(height: 0.h, thickness: 0.5, color: Color(0xFF7F7F7F)),
              SizedBox(height: 32.h),

              GestureDetector(
                onTap: () => _pickImage(context, ImageSource.camera),
                child: SizedBox(
                  width: 340.w,
                  height: 48.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        AppAssets.backgroundMakeAPhoto,
                        width: 340.w,
                        height: 48.h,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        'Make a photo',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(0, 0, 0, 1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 4.h),

              GestureDetector(
                onTap: () => _pickImage(context, ImageSource.gallery),
                child: SizedBox(
                  width: 340.w,
                  height: 48.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        AppAssets.backgroundChoosePhoto,
                        width: 340.w,
                        height: 48.h,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        'Choose photo',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 8.h),

              GestureDetector(
                onTap: () {
                  context.read<ProfileOverlayBloc>().add(HideOverlayEvent());
                },
                child: SizedBox(
                  width: 340.w,
                  height: 48.h,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        AppAssets.backgroundCancel,
                        width: 340.w,
                        height: 48.h,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        'Cancel',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                          fontSize: 19.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
