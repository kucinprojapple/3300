import 'dart:async' show Timer;

import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_gym_club/app_core_design/assets.dart' show AppAssets;
import 'package:green_gym_club/app_core_design/colors.dart';
import 'package:green_gym_club/app_core_design/text_styles.dart';

import '../app_core_design/texts.dart';

class AnimationLoader extends StatefulWidget {
  const AnimationLoader({
    super.key,
    required this.zero,
    required this.first,
    required this.second,
    required this.isFirstOpen,
    required this.onComplete,
  });
  final bool first;
  final bool second;
  final bool zero;
  final bool isFirstOpen;
  final VoidCallback onComplete;

  @override
  State<AnimationLoader> createState() => _AnimationLoaderState();
}

class _AnimationLoaderState extends State<AnimationLoader> {
  late Timer _timer;
  double _width = 10;
  double _value = 15;
  int _duration = 600;
  @override
  void initState() {
    super.initState();
    _timerLoadingStart();
    if (widget.zero) {
      _duration = 500;
      _value = 18;
      _width = 30;
    }
    if (!widget.first && !widget.second && !widget.zero) {
      _duration = 500;
      _value = 22;
      _width = 80;
    }
    if (widget.first) {
      _value = 51;
      _width = 170;
    }
    if (widget.second) {
      _value = 99;
      _width = 240;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(
        Duration(milliseconds: _duration),
        () => widget.onComplete(),
      );
    });
    super.initState();
  }

  _timerLoadingStart() {
    _timer = Timer.periodic(const Duration(milliseconds: 135), (time) {
      if (widget.first) {
        if (time.tick < 15) {
          setState(() {
            _width += 4;
            _value += 2;
          });
        }

        if (time.tick == 21) {
          setState(() {
            _width = 200;
            _value = 74;
          });
        }
      }
      if (widget.second) {
        if (time.tick == 25) {
          setState(() {
            _width = 260;
            _value = 95;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        Column(
          children: [
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 20.h),
                  Image.asset(
                    AppAssets.shirt,
                    height: 200.h,
                    fit: BoxFit.fill,
                    alignment: Alignment.bottomCenter,
                  ),
                  SizedBox(height: 20.h),
                  Center(
                    child: Text(
                      AppTexts.loading,
                      style: AppTextStyles.headers(
                        context,
                      ).m.apply(color: AppColors.mainColors.white),
                    ),
                  ),

                  Stack(
                    fit: StackFit.loose,
                    children: [
                      Center(
                        child: Container(
                          height: 40,
                          width: 300,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: AppColors.mainColors.primaryGreen,
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Container(
                            height: 38,
                            width: 300,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.mainColors.white,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 100),
                              height: 20,
                              width: _width,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF4BCB0B),
                                      Color(0xFF2F8703),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 4.0),
                          child: Text(
                            '${_value.toStringAsFixed(0)} %',
                            style: AppTextStyles.headers(
                              context,
                            ).xs.apply(color: AppColors.mainColors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 80),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
