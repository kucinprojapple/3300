import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_gym_club/router/router.dart';

class GreenGymClub extends StatelessWidget {
  final _router = AppRouter();

  GreenGymClub({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Green Gym Club',
          routerConfig: _router.config(),
        );
      },
    );
  }
}
