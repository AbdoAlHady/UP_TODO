import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/features/task/presentation/screens/home_screen/widgets/task_status.dart';
import '../../../../../../core/helpers/font_weight_helper.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../functions/show_bottom_sheet.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        taskBottomSheet(context);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        height: 128.h,
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: AppColors.green, borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    'Task 1',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.apply(color: AppColors.white),
                  ),
                  verticalSapce(8),
                  // Time
                  Row(
                    children: [
                      const Icon(Icons.watch_later_outlined),
                      horizontalSpace(8),
                      Text(
                        '09:33 PM - 09:48 PM',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  ),
                  verticalSapce(8),
                  // Description
                  Text(
                    'Learn Dart Learn Dart',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontWeight: FontWeightHelpers.regular),
                  ),
                ],
              ),
            ),
            const TaskStatus()
          ],
        ),
      ),
    );
  }
}
