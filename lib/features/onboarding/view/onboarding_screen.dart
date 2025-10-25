import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../router/router.dart';
import '../onboarding_cubit/onboarding_cubit.dart';
import '../onboarding_cubit/onboarding_state.dart';
import 'onboarding_step_five_widget.dart';
import 'onboarding_step_four_widget.dart';
import 'onboarding_step_one_widget.dart';
import 'onboarding_step_six_widget.dart';
import 'onboarding_step_three_widget.dart';
import 'onboarding_step_two_widget.dart';

@RoutePage(name: 'OnboardingWrapperRoute')
class OnboardingWrapper extends StatelessWidget {
  const OnboardingWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(totalScreens: 6),
      child: const OnboardingScreen(),
    );
  }
}

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  List<Widget> get pages => [
    OnboardingStepOneWidget(onNext: _next, stepIndex: 1),
    OnboardingStepTwoWidget(onNext: _next, stepIndex: 2),
    OnboardingStepThreeWidget(onNext: _next, stepIndex: 3),
    OnboardingStepFourWidget(onNext: _next, stepIndex: 4),
    OnboardingStepFiveWidget(onNext: _next, stepIndex: 5),
    OnboardingStepSixWidget(onNext: _next, stepIndex: 6),
  ];

  void _next() {
    final cubit = context.read<OnboardingCubit>();
    final currentIndex = cubit.state.pageIndex;

    if (currentIndex < pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      cubit.goNext();
    } else {
      context.router.replaceAll([const MenuRoute()]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(totalScreens: pages.length),
      child: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          final currentIndex = state.pageIndex;
          return Scaffold(
            body: PageView(
              controller: _controller,
              physics: const NeverScrollableScrollPhysics(),
              children: pages,
              onPageChanged: (index) {
                context.read<OnboardingCubit>().setPage(index);
              },
            ),
          );
        },
      ),
    );
  }
}
