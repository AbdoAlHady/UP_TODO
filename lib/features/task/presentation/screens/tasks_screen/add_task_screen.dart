import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/helpers/spacing.dart';
import 'package:todo_app/core/utils/app_strings.dart';
import 'package:todo_app/core/widgets/app_elveated_button.dart';
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
              // Title
              Text(AppStrings.title,
                  style: Theme.of(context).textTheme.titleSmall),
              verticalSapce(10),
              const AppTextFormField(hintText: AppStrings.titleHint),
              verticalSapce(24),
              // Note
              Text(AppStrings.note,
                  style: Theme.of(context).textTheme.titleSmall),
              verticalSapce(10),
              const AppTextFormField(hintText: AppStrings.noteHint),
              verticalSapce(24),
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
              AppTextButton(
                buttonText: AppStrings.createTask,
                textStyle: Theme.of(context).textTheme.titleSmall!,
                onPressed: () {},
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}


