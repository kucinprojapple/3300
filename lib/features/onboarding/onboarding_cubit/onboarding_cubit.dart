import 'package:flutter_bloc/flutter_bloc.dart';

import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  final int totalScreens;

  OnboardingCubit({required this.totalScreens})
      : super(const OnboardingState(pageIndex: 0));

  void goNext() {
    if (state.pageIndex < totalScreens - 1) {
      emit(OnboardingState(pageIndex: state.pageIndex + 1));
    } else {
      emit(OnboardingState(pageIndex: state.pageIndex, finished: true));
    }
  }

  void skipToLast() {
    emit(OnboardingState(pageIndex: totalScreens - 1, finished: true));
  }

  void setPage(int index) {
    emit(OnboardingState(pageIndex: index));
  }
}
