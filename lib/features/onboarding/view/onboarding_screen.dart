import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../router/router.dart';
import '../onboarding_cubit/onboarding_cubit.dart';
import '../onboarding_cubit/onboarding_state.dart';
import 'onbording_step_one_widget.dart';
import 'onbording_step_two_widget.dart';


@RoutePage(name: 'OnboardingWrapperRoute')
class OnboardingWrapper extends StatelessWidget {
  const OnboardingWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(totalScreens: 2),
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
    OnboardingStepOneWidget(onNext: _next),
    OnboardingStepTwoWidget(onNext: _next),
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
      context.router.replaceAll([const OnboardingWrapperRoute()]);
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
            // bottomNavigationBar: Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: ElevatedButton(
            //     onPressed: () {
            //       if (currentIndex < pages.length - 1) {
            //         _controller.nextPage(
            //           duration: const Duration(milliseconds: 300),
            //           curve: Curves.easeInOut,
            //         );
            //         context.read<OnboardingCubit>().goNext();
            //       } else {
            //         context.router.replaceAll([const HomeRoute()]);
            //       }
            //     },
            //     child: Text(currentIndex < pages.length - 1 ? 'Next' : 'Start'),
            //   ),
            // ),
          );
        },
      ),
    );
  }
}
