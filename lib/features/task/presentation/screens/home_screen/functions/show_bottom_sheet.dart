import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/helpers/extension.dart';
import 'package:todo_app/features/task/presentation/cubit/add_task_cubit.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/widgets/app_elveated_button.dart';

void taskBottomSheet(context, int id, int completed) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        height: 250.h,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: AppColors.darkGrey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              if(completed!=1)
              AppTextButton(
                  buttonText: AppStrings.taskComplete,
                  textStyle: Theme.of(context).textTheme.titleSmall!,
                  onPressed: () => context.read<TaskCubit>().updateTask(id)),
              verticalSapce(24),
              AppTextButton(
                  buttonText: AppStrings.deleteTask,
                  backgroundColor: AppColors.red,
                  textStyle: Theme.of(context).textTheme.titleSmall!,
                  onPressed: () => context.read<TaskCubit>().deleteTask(id)),
              verticalSapce(24),
              AppTextButton(
                  buttonText: AppStrings.cancel,
                  textStyle: Theme.of(context).textTheme.titleSmall!,
                  onPressed: () => context.pop()),
            ],
          ),
        ),
      );
    },
    elevation: 0,
  );
}
