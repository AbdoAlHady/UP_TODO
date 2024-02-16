import 'package:flutter/material.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/theme/text_styles.dart';
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
    return Column(
            children: [
              verticalSapce(15),
              /// Image
              Image.asset(image),
              verticalSapce(16),
              /// Dots
              verticalSapce(50),
              /// Title
              Text(onBoardingTitle, style: TextStyles.font32WhiteBold),
              verticalSapce(40),
              /// supTitle
              Text(
                onBoardingSupTitle,
                textAlign: TextAlign.center,
                style: TextStyles.font16WhiteRegular
                    .copyWith(color: AppColors.white.withOpacity(0.87)),
              ),
              verticalSapce(80),
            ],
          );
  }
}
