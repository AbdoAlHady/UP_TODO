import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../cubit/on_boarding_cubit.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 420.h,
      left: 88.w,
      child: SmoothPageIndicator(
        controller: context.read<OnBoardingCubit>().controller,
        count: 3,
        onDotClicked: context.read<OnBoardingCubit>().dotNavigationClicked,
        effect: ExpandingDotsEffect(
            dotHeight: 10.h,
            dotWidth: 26.w,
            activeDotColor: AppColors.primaryColor,
            dotColor: AppColors.grey),
      ),
    );
  }
}
