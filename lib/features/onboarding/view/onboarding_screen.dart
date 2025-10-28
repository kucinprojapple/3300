import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';

import '../../../router/router.dart';
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
  int currentIndex = 0;

  late final List<Widget> onboardingPages = [
    OnboardingStepWidget(
      stepIndex: 1,
      mainContent: OnboardingStep1Widget(),
      title: 'Workout Begins',
      description: 'Unlock your random workout!',
      onNext: () {
        setState(() {
          currentIndex++;
        });
      },
    ),
    OnboardingStepWidget(
      stepIndex: 2,
      mainContent: OnboardingStep2Widget(),
      title: 'Ready, Set, Timer!',
      description: 'Your exercise is set. Get ready for a 30–120 sec timer.',
      onNext: () {
        setState(() {
          currentIndex++;
        });
      },
    ),
    OnboardingStepWidget(
      stepIndex: 3,
      mainContent: OnboardingStep3Widget(),
      title: 'Record Your Reps',
      description: 'After the timer, log your reps to track progress.',
      onNext: () {
        setState(() {
          currentIndex++;
        });
      },
    ),
    OnboardingStepWidget(
      stepIndex: 4,
      mainContent: OnboardingStep4Widget(),
      title: 'Build Your Profile',
      description:
          'Your profile displays your results, favorite exercise, title, and frame—change them to stand out!',
      onNext: () {
        setState(() {
          currentIndex++;
        });
      },
    ),
    OnboardingStepWidget(
      stepIndex: 5,
      mainContent: OnboardingStep5Widget(),
      title: 'Unlock Achievements',
      description:
          'Complete challenges and earn fun titles and profile frames.',
      onNext: () {
        setState(() {
          currentIndex++;
        });
      },
    ),
    OnboardingStepWidget(
      stepIndex: 6,
      mainContent: OnboardingStep6Widget(),
      title: 'Learn the Moves',
      description:
          'Read proper form, target muscles, and pro tips for every exercise.',
      onNext: () {
        context.router.replaceAll([const MenuRoute()]);
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Onboarding(
            swipeableBody: onboardingPages,
            startIndex: currentIndex,
            animationInMilliseconds: 300,
            onPageChanges: (
              double dragDistance,
              int totalPages,
              int index,
              SlideDirection direction,
            ) {
              setState(() => currentIndex = index);
            },

            buildHeader: (
              context,
              dragDistance,
              totalPages,
              index,
              setIndex,
              direction,
            ) {
              return const SizedBox.shrink();
            },

            buildFooter: (
              context,
              dragDistance,
              totalPages,
              index,
              setIndex,
              direction,
            ) {
              return const SizedBox.shrink();
            },
          ),

          // Positioned(
          //   left: 0,
          //   right: 0,
          //   bottom: 109.h,
          //   child: Center(
          //     child: Builder(
          //       builder: (context) {
          //         final bool isLast = currentIndex == onboardingPages.length - 1;
          //         return ActionButtonWidget(
          //           width: 227.w,
          //           height: 89.h,
          //           text: 'Next',
          //           fontSize: 35.sp,
          //           onPressed: () {
          //             if (isLast) {
          //               context.router.replaceAll([const MenuRoute()]);
          //             } else {
          //               setState(() {
          //                 currentIndex++;
          //               });
          //             }
          //           },
          //         );
          //       },
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
