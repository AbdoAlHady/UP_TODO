import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/helpers/spacing.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/features/task/presentation/cubit/add_task_cubit.dart';
import 'package:todo_app/features/task/presentation/screens/tasks_screen/widgets/create_task_btn.dart';
import 'package:todo_app/features/task/presentation/screens/tasks_screen/widgets/task_colors.dart';
import 'package:todo_app/features/task/presentation/screens/tasks_screen/widgets/task_date.dart';
import 'package:todo_app/features/task/presentation/screens/tasks_screen/widgets/task_duration_time.dart';
import '../../../../../core/widgets/app_text_form_field.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.addTask),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Form(
                key: context.read<TaskCubit>().formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //! Title,
                    Text(AppStrings.title,
                        style: Theme.of(context).textTheme.titleSmall),
                    verticalSapce(10),
                    AppTextFormField(
                      hintText: AppStrings.titleHint,
                      controller: context.read<TaskCubit>().title,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Title is required';
                        }
                        return null;
                      },
                    ),
                    verticalSapce(24),
                    //! Note
                    Text(AppStrings.note,
                        style: Theme.of(context).textTheme.titleSmall),
                    verticalSapce(10),
                    AppTextFormField(
                      hintText: AppStrings.noteHint,
                      controller: context.read<TaskCubit>().note,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Note is required';
                        }
                        return null;
                      },
                    ),
                    verticalSapce(24),
                  ],
                ),
              ),
          
              // Date
              const TaskDate(),
              verticalSapce(24),
              //! Start & End Time
              const TaskDurationTime(),
              verticalSapce(24),
              //! Color
              const TaskColors(),
              verticalSapce(92),
              //! Add Task Button
              const CreateTaskBtn(),
            ],
          ),
        ),
      ),
    );
  }
}
