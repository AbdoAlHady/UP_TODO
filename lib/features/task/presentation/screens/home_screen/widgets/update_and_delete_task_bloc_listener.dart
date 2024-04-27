import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/helpers/extension.dart';
import 'package:todo_app/core/helpers/loaders.dart';
import 'package:todo_app/features/task/presentation/cubit/add_task_cubit.dart';
import 'package:todo_app/features/task/presentation/cubit/add_task_state.dart';

class UpdateAndDeleteTaskBlocListener extends StatelessWidget {
  const UpdateAndDeleteTaskBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TaskCubit, TaskState>(
      listenWhen: (previous, current) =>
          current is UpdateTaskFailureState ||
          current is UpdateTaskLoadingState ||
          current is UpdateTaskSuccessState ||
          current is DeleteTaskFailureState ||
          current is DeleteTaskLoadingState ||
          current is DeleteTaskSuccessState,
      listener: (context, state) {
        if (state is UpdateTaskSuccessState) {
          context.pop();
          Loaders.showToast(
              message: 'Task Completed Successfly', type: ToastState.success);
        } else if (state is DeleteTaskSuccessState) {
          context.pop();
          Loaders.showToast(
              message: 'Task Deleted Successfly', type: ToastState.success);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
