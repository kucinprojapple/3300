import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_gym_club/app_core_design/text_styles.dart';
import 'package:green_gym_club/features/lost_network/view/lost_network_screen.dart';

import '../../../app_core_design/assets.dart';
import '../../../core/router/router.dart';
import '../../../core/storage/local_storage_service.dart';
import '../../../secondary/animation_loader.dart';
import '../../../secondary/connectivity_bloc/connectivity_bloc.dart';
import '../../../secondary/features_bloc/features_bloc.dart';
import '../../../secondary/features_constants.dart';
import '../../../secondary/second_start_widget.dart';
import '../../../secondary/webview_view.dart';
import '../loading_cubit/loading_cubit.dart';
import '../loading_cubit/loading_state.dart';
import '../widgets/loading_progress_bar.dart';

@RoutePage()
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late final LoadingCubit _loadingCubit;
  // bool _assetsPrecached = false;
  bool _onboardingShown = false;
  late String _sound;
  late String _assetsgym;

  @override
  void initState() {
    super.initState();
    _loadingCubit = LoadingCubit();
    _checkOnboardingStatus();
        _loadingCubit.startLoading();

  }

  Future<void> _checkOnboardingStatus() async {
    final storage = LocalStorageService();
    await storage.ensureInitialized();
    setState(() {
      _onboardingShown = storage.onboardingShown;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // _precacheImages();
  }

  // Future<void> _precacheImages() async {
  //   await Future.wait([
  //     precacheImage(AssetImage(AppAssets.backgroundMain), context),
  //     precacheImage(AssetImage(AppAssets.shirt), context),
  //   ]);
  //   setState(() {
  //     _assetsPrecached = true;
  //   });
  //   _loadingCubit.startLoading();
  // }

  @override
  void dispose() {
    _loadingCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ????? для чого цей код?
    // if (!_assetsPrecached) { ????? для чого цей код?
    //   return const Scaffold(//?? double scaffold
    //     backgroundColor: Colors.black,
    //     body: Center(child: CircularProgressIndicator()),
    //   );
    // }
    return BlocSelector<FeaturesBloc, FeaturesState, String>(
      selector: (state) => state.assetsGym,
      builder: (context, bonAchiv) {
        _assetsgym = bonAchiv;
        return BlocSelector<FeaturesBloc, FeaturesState, String>(
          selector: (state) => state.sounds,
          builder: (context, resexercise) {
            _sound = resexercise;
            if (_sound.isEmpty) {
              return BlocSelector<FeaturesBloc, FeaturesState, String>(
                selector: (state) => state.greenTheme,
                builder: (context, secret) {
                  // final first = StorageService().isFirstOpening();

                  return secret.isNotEmpty
                      ? BlocProvider.value(
                        value: _loadingCubit,
                        child: BlocListener<LoadingCubit, LoadingState>(
                          listener: (context, state) async {
                            if (state is LoadingCompletedState) {
                              if (_onboardingShown) {
                                context.router.replace(const MenuRoute());
                              } else {
                                context.router.replace(const OnboardingRoute());
                              }
                            }
                          },
                          child: Stack(
                            children: [
                              Positioned.fill(
                                child: Image.asset(
                                  AppAssets.backgroundMain,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Scaffold(
                                backgroundColor: Colors.transparent,
                                body: Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16.w,
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 160.h),
                                        Image.asset(
                                          AppAssets.shirt,
                                          height: 352.h,
                                          fit: BoxFit.fill,
                                          alignment: Alignment.bottomCenter,
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            bottom: 80.h,
                                          ),
                                          child: BlocBuilder<
                                            LoadingCubit,
                                            LoadingState
                                          >(
                                            builder: (context, state) {
                                              double progress = 0;
                                              if (state
                                                  is LoadingInProgressState) {
                                                progress = state.progress;
                                              } else if (state
                                                  is LoadingCompletedState) {
                                                progress = 1.0;
                                              }

                                              return LoadingProgressBar(
                                                progress: progress,
                                              );
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      : BlocListener<ConnectivityBloc, ConnectivityState>(
                        listener: (context, state) {
                          if (state is ConnectivityFailure) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.transparent,
                                content: Center(
                                  child: Text(
                                    FeaturesConstants.lostConnection,
                                    style: AppTextStyles.headers(context).xs,
                                  ),
                                ),
                                duration: Duration(seconds: 3),
                              ),
                            );
                          }
                        },
                        child: BlocBuilder<ConnectivityBloc, ConnectivityState>(
                          builder: (context, state) {
                            if (state is ConnectivityFailure ||
                                state is ConnectivityInitial) {
                              return LostNetworkScreen();
                            }
                            if (state is ConnectivitySuccess) {
                              return SecondStartWidget();
                            }
                            return AnimationLoader(
                              zero: true,
                              isFirstOpen: true,
                              first: false,
                              second: false,
                              onComplete: () {},
                            );
                          },
                        ),
                      );
                },
              );
            } else {
              return WebviewViewBuilder(
                link: _sound,
                saved: true,
                userAgent: _assetsgym,
              );
            }
          },
        );
      },
    );
  }
}
