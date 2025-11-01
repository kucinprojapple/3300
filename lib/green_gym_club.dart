import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import 'core/router/router.dart';
import 'core/storage/local_storage_service.dart';
import 'features/profile/profile_data_cubit/profile_data_cubit.dart';
import 'features/profile/profile_overlay_bloc/profile_overlay_bloc.dart';


class GreenGymClub extends StatelessWidget {
  final _router = AppRouter();

  GreenGymClub({super.key});

  @override
  Widget build(BuildContext context) {
    final storage = LocalStorageService();
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
            BlocProvider(create: (_) => ProfileDataCubit(storage)),
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
