import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_gym_club/features/profile/profile_bloc/profile_bloc.dart';
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
        return MultiBlocProvider(
          providers: [
            BlocProvider<ProfileOverlayBloc>(
              create: (context) => ProfileOverlayBloc(),
            ),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Green Gym Club',
            routerConfig: _router.config(),
          ),
        );
      },
    );
  }
}
