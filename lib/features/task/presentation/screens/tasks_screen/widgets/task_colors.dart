import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/features/task/presentation/cubit/add_task_cubit.dart';
import 'package:todo_app/features/task/presentation/cubit/add_task_state.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/utils/app_strings.dart';

class TaskColors extends StatelessWidget {
  const TaskColors({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.color,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        verticalSapce(8),
        BlocBuilder<TaskCubit, TaskState>(
          builder: (context, state) {
            return SizedBox(
              height: 40.h,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        context.read<TaskCubit>().changeColorIndex(index);
                      },
                      child: CircleAvatar(
                        backgroundColor:
                            context.read<TaskCubit>().getColor(index),
                        child: context.read<TaskCubit>().currentIndex == index
                            ? const Icon(Icons.check)
                            : null,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => horizontalSpace(8),
                  itemCount: 6),
            );
          },
        )
      ],
    );
  }
}
