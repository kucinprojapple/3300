import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';
import '../../../app_core_design/styles.dart';
import '../../../core/widgets/custom_gradient_container_widget.dart';

@RoutePage()
class LostNetworkScreen extends StatelessWidget {
  const LostNetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppAssets.backgroundMain, fit: BoxFit.fill),
          ),

          Positioned(
            left: (MediaQuery.of(context).size.width - 322.w) / 2,
            top: 244.h,

            child: CustomGradientContainerWidget(
              width: 322.w,
              height: 308.h,
              backgroundGradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF1D5401), Color(0xFF020500)],
              ),
              borderGradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF7E7B7B), Color(0xFF848484)],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 15.h),
                  MainTextBody.gradientText(
                    context,
                    'Lost Network',
                    size: TextSize.l,
                    alignment: Alignment.center,
                    // useGradient: false,
                    // useShadow: false,
                    height: 1.0,
                  ),
                  SizedBox(height: 32.h),
                  Image.asset(
                    AppAssets.lostNetwork,
                    width: 232.w,
                    height: 180.h,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
