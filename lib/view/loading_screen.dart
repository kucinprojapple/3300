import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_gym_club/app_core_design/assets.dart';

import '../features/loading/loading_cubit/loading_cubit.dart';
import '../features/loading/loading_cubit/loading_state.dart';
import '../features/loading/widgets/loading_progress_bar.dart';
import '../router/router.dart';

@RoutePage()
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late final LoadingCubit _loadingCubit;
  bool _assetsPrecached = false;

  @override
  void initState() {
    super.initState();
    _loadingCubit = LoadingCubit();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _precacheImages();
  }

  Future<void> _precacheImages() async {
    await Future.wait([
      precacheImage(AssetImage(AppAssets.backgroundMain), context),
      precacheImage(AssetImage(AppAssets.shirt), context),
    ]);
    setState(() {
      _assetsPrecached = true;
    });
    _loadingCubit.startLoading();
  }

  @override
  void dispose() {
    _loadingCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_assetsPrecached) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return BlocProvider.value(
      value: _loadingCubit,
      child: BlocListener<LoadingCubit, LoadingState>(
        listener: (context, state) {
          if (state is LoadingCompleted) {
            context.router.replace(const OnboardingWrapperRoute());
          }
        },
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(AppAssets.backgroundMain, fit: BoxFit.fill),
              ),
              Positioned(
                left: 44.w,
                right: 44.w,
                bottom: 246.h,
                child: Image.asset(
                  AppAssets.shirt,
                  height: 352.h,
                  fit: BoxFit.fill,
                  alignment: Alignment.bottomCenter,
                ),
              ),
              Positioned(
                left: 32.w,
                right: 32.w,
                bottom: 64.h,
                child: BlocBuilder<LoadingCubit, LoadingState>(
                  builder: (context, state) {
                    double progress = 0;
                    if (state is LoadingInProgress) {
                      progress = state.progress;
                    } else if (state is LoadingCompleted) {
                      progress = 1.0;
                    }

                    return LoadingProgressBar(progress: progress);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
