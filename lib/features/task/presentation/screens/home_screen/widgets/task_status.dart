import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_strings.dart';

class TaskStatus extends StatelessWidget {
  const TaskStatus({
    super.key,
    required this.isComplete,
  });
  final bool isComplete;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: AppColors.white,
            width: 80.h,
            height: 1.w,
          ),
          verticalSapce(3),
          Text(
            isComplete ? AppStrings.compelete : AppStrings.todo,
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.apply(color: AppColors.white),
          )
        ],
      ),
    );
  }
}
