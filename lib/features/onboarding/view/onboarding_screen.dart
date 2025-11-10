import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_core_design/assets.dart';
import '../../../app_core_design/texts.dart';
import '../../../core/router/router.dart';
import '../../../core/widgets/action_button_widget.dart';
import '../widgets/onboarding_step_1_widget.dart';
import '../widgets/onboarding_step_2_widget.dart';
import '../widgets/onboarding_step_3_widget.dart';
import '../widgets/onboarding_step_4_widget.dart';
import '../widgets/onboarding_step_5_widget.dart';
import '../widgets/onboarding_step_6_widget.dart';
import '../widgets/onboarding_step_widget.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController pageController = PageController();
  late final List<Widget> onboardingPages = [
    OnboardingStepWidget(
      stepIndex: 1,
      mainContent: OnboardingStep1Widget(),
      title: AppTexts.onboardingStep1Title,
      description: AppTexts.onboardingStep1Desc,
    ),
    OnboardingStepWidget(
      stepIndex: 2,
      mainContent: OnboardingStep2Widget(),
      title: AppTexts.onboardingStep2Title,
      description: AppTexts.onboardingStep2Desc,
    ),
    OnboardingStepWidget(
      stepIndex: 3,
      mainContent: OnboardingStep3Widget(),
      title: AppTexts.onboardingStep3Title,
      description: AppTexts.onboardingStep3Desc,
    ),
    OnboardingStepWidget(
      stepIndex: 4,
      mainContent: OnboardingStep4Widget(),
      title: AppTexts.onboardingStep4Title,
      description: AppTexts.onboardingStep4Desc,
    ),
    OnboardingStepWidget(
      stepIndex: 5,
      mainContent: OnboardingStep5Widget(),
      title: AppTexts.onboardingStep5Title,
      description: AppTexts.onboardingStep5Desc,
    ),
    OnboardingStepWidget(
      stepIndex: 6,
      mainContent: OnboardingStep6Widget(),
      title: AppTexts.onboardingStep6Title,
      description: AppTexts.onboardingStep6Desc,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(AppAssets.backgroundMain, fit: BoxFit.fill),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 540.h,
                child: PageView(
                  controller: pageController,
                  children: onboardingPages,
                ),
              ),
              SizedBox(height: 16),
              Builder(
                builder: (context) {
                  return ActionButtonWidget(
                    width: 200.w,
                    height: 80.h,
                    text: AppTexts.buttonNext,
                    fontSize: 35.sp,
                    onPressed: () {
                      final bool isLast =
                          pageController.page == onboardingPages.length - 1;
                      if (isLast) {
                        context.router.replaceAll([const MenuRoute()]);
                      } else {
                        pageController.animateToPage(
                          ((pageController.page ?? 0) + 1).toInt(),
                          duration: Duration(milliseconds: 200),
                          curve: Curves.decelerate,
                        );
                      }
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
