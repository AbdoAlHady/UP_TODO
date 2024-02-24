import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/helpers/extension.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/features/task/presentation/cubit/add_task_state.dart';

import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/widgets/app_elveated_button.dart';
import '../../../cubit/add_task_cubit.dart';

class CreateTaskBtn extends StatelessWidget {
  const CreateTaskBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TaskCubit, TaskState>(
      listener: (context, state) {
        if (state is AddTaskSuccessState) {
          context.pop();
        }
      },
      builder: (context, state) {
        if (state is AddTaskLoadingState) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primaryColor,
            ),
          );
        } else {
          return AppTextButton(
            buttonText: AppStrings.createTask,
            textStyle: Theme.of(context).textTheme.titleSmall!,
            onPressed: () {
              if (context.read<TaskCubit>().formKey.currentState!.validate()) {
                context.read<TaskCubit>().addTask();
              }
            },
          );
        }
      },
    );
  }
}
