import 'package:flutter/material.dart';
import 'package:todo_app/features/task/presentation/screens/tasks_screen/widgets/task_time.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/utils/app_strings.dart';

class TaskDurationTime extends StatelessWidget {
  const TaskDurationTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         TaskTime(
          title: AppStrings.startTime,
          onTap: () async {
            TimeOfDay? selectedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(
                      DateTime.now(),
                    ),
                  );
          },
        ),
        horizontalSpace(27),
        const TaskTime(title: AppStrings.startTime),
      ],
    );
  }
}
