import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';


import '../../../app_core_design/styles.dart';

class SwitchWithPrefsWidget extends StatefulWidget {
  final String title;
  final bool initialValue;
  final ValueChanged<bool> onChanged;

  const SwitchWithPrefsWidget({
    super.key,
    required this.title,
    required this.initialValue,
    required this.onChanged,
  });

  @override
  State<SwitchWithPrefsWidget> createState() => _SwitchWithPrefsWidgetState();
}

class _SwitchWithPrefsWidgetState extends State<SwitchWithPrefsWidget>
    with SingleTickerProviderStateMixin {
  late bool status;

  @override
  void initState() {
    super.initState();
    status = widget.initialValue;
  }

  void _toggle() {
    final newVal = !status;
    setState(() => status = newVal);
    widget.onChanged(newVal);
  }

  @override
  Widget build(BuildContext context) {
    // outer sizes according to your design
    final double outerW = 64.53.w;
    final double outerH = 27.75.h;
    final double radius = 13.87.r;
    final double circleSize = 23.25.w; // размер кружка по макету
    // padding inside container so circle doesn't touch border hard
    final double innerPadding = (outerH - circleSize) / 2;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Title
          // Text(
          //   widget.title,
          //   style: GoogleFonts.rubikMonoOne(
          //     fontSize: 16.sp,
          //     fontWeight: FontWeight.bold,
          //     letterSpacing: 1.5.sp,
          //     color: Colors.white,
          //   ),
          // ),
          NumbersTextBody.gradientNumbers(
            context,
            widget.title,
            size: TextSize.m,
            alignment: Alignment.bottomCenter,
            useShadow: false,
            height: 1.1,
          ),

          // Switch area — GestureDetector so whole thing toggles
          GestureDetector(
            onTap: _toggle,
            child: Container(
              width: outerW,
              height: outerH,
              // Decoration is not animated to avoid BoxBorder.lerp problem
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: status
                      ? const [Color(0xFF1BC431), Color(0xFF007421)] // unlocked bg
                      : const [Color(0xFFFD3D3D), Color(0xFFAE0505)], // locked bg
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(0, 1.34),
                    blurRadius: 4.48,
                  ),
                ],
                // border via GradientBoxBorder (static, not animated)
                border: GradientBoxBorder(
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFFE31E1E), Color(0xFFAE0505)],
                  ),
                  width: 1,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: innerPadding),
                child: Stack(
                  children: [
                    // AnimatedAlign moves the circle left/right
                    AnimatedAlign(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      alignment:
                      status ? Alignment.centerRight : Alignment.centerLeft,
                      child: _buildToggleCircle(status, circleSize),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Кастомный кружок: использует свой градиент/бордер/тень для locked/unlocked
  Widget _buildToggleCircle(bool isActive, double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.55.r),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isActive
              ? const [Color(0xFF116803), Color(0xFF102B02)] // анлок - сверху светлее
              : const [Color(0xFFAE0505), Color(0xFF4A0404)], // лок - сверху светлее
        ),
        // Используем GradientBoxBorder для рамки кружка
        border: GradientBoxBorder(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: isActive
                ? const [Color(0xFF116803), Color(0xFF147D03)]
                : const [Color(0xFFB30303), Color(0xFFFD3D3D)],
          ),
          width: 1,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(0, 1.34),
            blurRadius: 4.48,
          ),
        ],
      ),
    );
  }
}
