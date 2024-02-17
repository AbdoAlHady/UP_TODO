import 'package:flutter/material.dart';
import 'package:todo_app/core/helpers/helper_functions.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/utils/app_colors.dart';
class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage(
      {super.key,
      required this.onBoardingTitle,
      required this.onBoardingSupTitle,
      required this.image});

  final String onBoardingTitle;
  final String onBoardingSupTitle;
  final String image;

  @override
  Widget build(BuildContext context) {
   final dark = HelperFunctions.isDarkMode(context);
    return Column(
            children: [
              verticalSapce(15),
              /// Image
              Image.asset(image),
              verticalSapce(16),
              /// Dots
              verticalSapce(50),
              /// Title
              Text(onBoardingTitle, style: Theme.of(context).textTheme.displayLarge),
              verticalSapce(40),
              /// supTitle
              Text(
                onBoardingSupTitle,
                textAlign: TextAlign.center,
                style:Theme.of(context).textTheme.titleMedium!.apply(color:dark? AppColors.white.withOpacity(0.87):AppColors.dark.withOpacity(0.87)),
              ),
              verticalSapce(80),
            ],
          );
  }
}
