import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/task/presentation/cubit/add_task_cubit.dart';
import 'package:todo_app/features/task/presentation/cubit/add_task_state.dart';
import 'package:todo_app/features/task/presentation/screens/tasks_screen/widgets/task_time.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/utils/app_strings.dart';

class TaskDurationTime extends StatelessWidget {
  const TaskDurationTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TaskTime(
              title: AppStrings.startTime,
              hint: context.read<TaskCubit>().startTime,
              onTap: () {
                context.read<TaskCubit>().getSartTime(context);
              },
            ),
            horizontalSpace(27),
            TaskTime(
              title: AppStrings.endTime,
              onTap: () => context.read<TaskCubit>().getEndTime(context),
              hint: context.read<TaskCubit>().endTime,
            ),
          ],
        );
      },
    );
  }
}
