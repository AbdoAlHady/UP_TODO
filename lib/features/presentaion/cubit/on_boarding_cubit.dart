import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitialState());
  int currentIndex = 0;
  PageController controller = PageController();

  void updatePageIndicator(index) {
    currentIndex = index;
    emit(UpdatePageIndicator());
  }

  void dotNavigationClicked(index) {
    currentIndex = index;
    controller.jumpToPage(index);
    emit(UpdatePageIndicator());
  }

  void nextPage() {
    if (currentIndex == 2) {
      currentIndex = 2;
      emit(JumpToHomeScreen());
    } else {
      currentIndex = currentIndex + 1;
      controller.jumpToPage(currentIndex);
      emit(UpdatePageIndicator());
    }
  }

  void backPage() {
    if (currentIndex > 0) {
      currentIndex = currentIndex - 1;

      controller.jumpToPage(currentIndex);
      emit(UpdatePageIndicator());
    }
  }

  void skipPage() {
    currentIndex = 2;
    controller.jumpToPage(2);
    emit(UpdatePageIndicator());
  }
}
