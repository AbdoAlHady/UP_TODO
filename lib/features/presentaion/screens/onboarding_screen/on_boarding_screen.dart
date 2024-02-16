import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/app_assets.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/features/presentaion/cubit/on_boarding_cubit.dart';
import 'package:todo_app/features/presentaion/screens/onboarding_screen/wigets/on_boarding_buttons.dart';
import 'package:todo_app/features/presentaion/screens/onboarding_screen/wigets/on_boarding_dot.dart';
import 'package:todo_app/features/presentaion/screens/onboarding_screen/wigets/skip_and_back_text.dart';
import 'wigets/on_boarding_page.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({super.key});
  final PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: SingleChildScrollView(
          child: Column(
                children: [
                  /// Skip Text
                  SkipAndBackText(
                    text: AppStrings.skip,
                    onTap: () => context.read<OnBoardingCubit>().skipPage(),
                  ),
                  // page view
                  SizedBox(
                    height: 715.h,
                    child: Stack(
                      children: [
                        PageView(
                          controller:
                              context.read<OnBoardingCubit>().controller,
                          children: const [
                            OnBoardingPage(
                                onBoardingTitle: AppStrings.onBoardingTitle1,
                                onBoardingSupTitle:
                                    AppStrings.onBoardingSubtitle1,
                                image: AppAssets.onBoardingOne),
                            OnBoardingPage(
                                onBoardingTitle: AppStrings.onBoardingTitle2,
                                onBoardingSupTitle:
                                    AppStrings.onBoardingSubtitle2,
                                image: AppAssets.onBoardingTwo),
                            OnBoardingPage(
                                onBoardingTitle: AppStrings.onBoardingTitle3,
                                onBoardingSupTitle:
                                    AppStrings.onBoardingSubtitle3,
                                image: AppAssets.onBoardingTree),
                          ],
                        ),
                        /// Dots
                        const OnBoardingDotNavigation(),
                      ],
                    ),
                  ),
                  /// Buttons
                  const OnBoardingButtons()
                ],
              ),
        ),
      )),
    );
  }
}

