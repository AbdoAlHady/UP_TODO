import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/routing/routes.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/features/presentaion/cubit/on_boarding_state.dart';
import 'package:todo_app/features/presentaion/screens/onboarding_screen/wigets/skip_and_back_text.dart';

import '../../../../../core/theme/text_styles.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/app_elveated_button.dart';
import '../../../cubit/on_boarding_cubit.dart';

class OnBoardingButtons extends StatelessWidget {
  const OnBoardingButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnBoardingCubit, OnBoardingState>(
      listener: (context, state){
        if (state is JumpToHomeScreen) {
           Navigator.pushNamed(context, Routes.homeScreen);
        }
      },
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // back buttons
            SkipAndBackText(
              text: AppStrings.back,
              onTap: () => context.read<OnBoardingCubit>().backPage(),
            ),
            // next button
            AppTextButton(
              buttonText: context.read<OnBoardingCubit>().currentIndex == 2
                  ? AppStrings.getStarted
                  : AppStrings.next,
              buttonWidth:
                  context.read<OnBoardingCubit>().currentIndex == 2 ? 151 : 90,
              onPressed: () => context.read<OnBoardingCubit>().nextPage(),
              textStyle:
                  TextStyles.font16WhiteRegular.apply(color: AppColors.white),
            ),
          ],
        );
      },
    );
  }
}
