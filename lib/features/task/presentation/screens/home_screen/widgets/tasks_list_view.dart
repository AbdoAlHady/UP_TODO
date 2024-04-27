import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/task/presentation/cubit/add_task_cubit.dart';
import 'package:todo_app/features/task/presentation/cubit/add_task_state.dart';
import 'package:todo_app/features/task/presentation/screens/home_screen/widgets/empty_tasks.dart';
import 'package:todo_app/features/task/presentation/screens/home_screen/widgets/task_item.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        return context.read<TaskCubit>().tasksList.isEmpty?const EmptyTasks() :Expanded(
          child: ListView.builder(
            // shrinkWrap: true,
            // physics: const NeverScrollableScrollPhysics(),
            itemCount: context.read<TaskCubit>().tasksList.length,
            itemBuilder: (context, index) {
              return TaskItem(
                task: context.read<TaskCubit>().tasksList[index],
              );
            },
          ),
        );
      },
    );
  }
}
