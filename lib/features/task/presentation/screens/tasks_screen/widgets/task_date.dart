import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/task/presentation/cubit/add_task_state.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/widgets/app_text_form_field.dart';
import '../../../cubit/add_task_cubit.dart';

class TaskDate extends StatelessWidget {
  const TaskDate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(AppStrings.date,
                style: Theme.of(context).textTheme.titleSmall),
            verticalSapce(10),
            AppTextFormField(
              readOnly: true,
              hintText: context.read<TaskCubit>().currentDate,
              suffixIcon: GestureDetector(
                  onTap: () {
                    context.read<TaskCubit>().getDate(context);
                  },
                  child: const Icon(Icons.calendar_month_sharp)),
            ),
          ],
        );
      },
    );
  }
}
