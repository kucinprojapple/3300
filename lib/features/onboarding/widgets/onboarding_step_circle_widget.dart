import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/styles.dart';
import '../../../core/widgets/custom_gradient_container_widget.dart';

class OnboardingStepCircleWidget extends StatelessWidget {
  final int stepIndex;

  const OnboardingStepCircleWidget({super.key, required this.stepIndex});

  @override
  Widget build(BuildContext context) {
    return CustomGradientContainerWidget(
      width: 44.w,
      height: 44.w,
      borderRadius: 22.r,
      borderWidth: 0.25.r,
      backgroundGradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFF2F8703), Color(0xFF4BCB0B)],
      ),
      borderGradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Color(0xFFAAA7A6), Color(0xFFFFFFFF)],
      ),
      child: Center(
        child: NumbersTextBody.gradientNumbers(
          context,
          '$stepIndex',
          alignment: Alignment.center,
          // useShadow: false,
          height: 1.1,
          fontSize: 30.sp,
        ),
      ),
    );
  }
}

// class OnboardingStepCircleWidget extends StatelessWidget {
//   final int stepIndex;
//
//   const OnboardingStepCircleWidget({super.key, required this.stepIndex});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return CustomPaint(
//       painter: _GradientBorderPainter(),
//       child: Container(
//         width: 44.w,
//         height: 44.h,
//         decoration: const BoxDecoration(
//           shape: BoxShape.circle,
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Color(0xFF2F8703), Color(0xFF4BCB0B)],
//           ),
//         ),
//         child: Center(
//           child: NumbersTextBody.gradientNumbers(context, '$stepIndex', size: TextSize.l),
//         ),
//         // child: Center(
//         //   child: Stack(
//         //     alignment: Alignment.center,
//         //     children: [
//         //       Text(
//         //         '$stepIndex',
//         //         style: textStyle.copyWith(
//         //           color: AppColors.textColors.shadowNumbers,
//         //           shadows: [
//         //             Shadow(
//         //               offset: Offset(0.w, 1.59.h),
//         //               blurRadius: 1.59.r,
//         //               color: Colors.black,
//         //             ),
//         //           ],
//         //         ),
//         //       ),
//         //
//         //       ShaderMask(
//         //         blendMode: BlendMode.srcIn,
//         //         shaderCallback:
//         //             (bounds) =>
//         //                 AppColors.textColors.numbersGradient.createShader(
//         //                   Rect.fromLTWH(0, 0, bounds.width, bounds.height),
//         //                 ),
//         //         child: Text(
//         //           '$stepIndex',
//         //           style: textStyle.copyWith(color: Colors.white),
//         //         ),
//         //       ),
//         //     ],
//         //   ),
//         // ),
//       ),
//     );
//   }
// }
//
// class _GradientBorderPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final rect = Offset.zero & size;
//     const gradient = LinearGradient(
//       begin: Alignment.topCenter,
//       end: Alignment.bottomCenter,
//       colors: [Color(0xFFAAA7A6), Color(0xFFFFFFFF)],
//     );
//     final paint =
//         Paint()
//           ..shader = gradient.createShader(rect)
//           ..style = PaintingStyle.stroke
//           ..strokeWidth = 0.27;
//     final radius = size.width / 2;
//     canvas.drawCircle(size.center(Offset.zero), radius - 0.135, paint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }
