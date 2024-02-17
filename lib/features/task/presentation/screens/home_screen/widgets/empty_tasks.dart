import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/helpers/helper_functions.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/utils/app_assets.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_strings.dart';

class EmptyTasks extends StatelessWidget {
  const EmptyTasks({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppAssets.emptyTask, width: 277.w, height: 277.h),
          verticalSapce(10),
          Text(AppStrings.emptyTaskTitle,
              style: Theme.of(context).textTheme.displaySmall!.apply(
                  color: dark
                      ? AppColors.white.withOpacity(0.87)
                      : AppColors.dark.withOpacity(0.87))),
          verticalSapce(10),
          Text(AppStrings.emptyTaskSubTitle,
              style: Theme.of(context).textTheme.titleSmall!.apply(
                  color: dark
                      ? AppColors.white.withOpacity(0.87)
                      : AppColors.dark.withOpacity(0.87))),
        ],
      ),
    );
  }
}
