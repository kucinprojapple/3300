import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_gym_club/features/game/repository/game_exercise_repository.dart';

import 'core/router/router.dart';
import 'core/storage/local_storage_service.dart';
import 'features/achievements/achievements_bloc/achievements_bloc.dart';
import 'features/achievements/achievements_overlay_bloc/achievements_overlay_bloc.dart';
import 'features/game/game_bloc/game_bloc.dart';
import 'features/profile/profile_data_cubit/profile_data_cubit.dart';
import 'features/profile/profile_overlay_bloc/profile_overlay_bloc.dart';


final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();

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
            BlocProvider(create: (context) => ProfileDataCubit(storage)),
            BlocProvider<AchievementsBloc>(
              create: (context) => AchievementsBloc(storage),
            ),
            BlocProvider<AchievementsOverlayBloc>(
              create: (context) => AchievementsOverlayBloc(),
            ),
            BlocProvider<GameBloc>(
              create: (context) => GameBloc(ExerciseRepository()),
            ),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Green Gym Club',
            routerConfig: _router.config(
            navigatorObservers: () => [routeObserver],
            ),
          ),
        );
      },
    );
  }
}
