import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/features/task/data/model/task_model.dart';
import 'package:todo_app/features/task/presentation/cubit/add_task_cubit.dart';
import 'package:todo_app/features/task/presentation/screens/home_screen/widgets/task_status.dart';
import '../../../../../../core/helpers/font_weight_helper.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../functions/show_bottom_sheet.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.task,
  });
  final TaskModel task;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        taskBottomSheet(context);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        height: 130.h,
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: context.read<TaskCubit>().getColor(task.color),
            borderRadius: BorderRadius.circular(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    task.title,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.apply(color: AppColors.white),
                  ),
                  verticalSapce(8),
                  // Time
                  Row(
                    children: [
                      const Icon(
                        Icons.watch_later_outlined,
                        color: AppColors.white,
                      ),
                      horizontalSpace(8),
                      Text(
                        '${task.startTime}- ${task.endTime}',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.apply(color: AppColors.white),
                      ),
                    ],
                  ),
                  verticalSapce(8),
                  // Note
                  Text(
                    task.note,
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontWeight: FontWeightHelpers.regular,
                        color: AppColors.white),
                  ),
                ],
              ),
            ),
            TaskStatus(
              isComplete: task.isComplete,
            )
          ],
        ),
      ),
    );
  }
}
