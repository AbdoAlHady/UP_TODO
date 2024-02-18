import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/helpers/spacing.dart';
import 'package:todo_app/core/utils/app_colors.dart';
import 'package:todo_app/core/utils/app_strings.dart';

import 'widgets/task_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Date now
                Text(DateFormat.yMMMd().format(DateTime.now()).toString(),
                    style: Theme.of(context).textTheme.displayMedium),
                verticalSapce(12),
                Text(AppStrings.today,
                    style: Theme.of(context).textTheme.displayMedium),
                verticalSapce(12),
                // Date Picker
                DatePicker(
                  height: 110.h,
                  DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  selectionColor: AppColors.primaryColor,
                  selectedTextColor: AppColors.white,
                  dateTextStyle: Theme.of(context).textTheme.titleSmall!,
                  monthTextStyle: Theme.of(context).textTheme.titleSmall!,
                  dayTextStyle: Theme.of(context).textTheme.titleSmall!,
                  onDateChange: (date) {},
                ),
                verticalSapce(30),
            
                // Empty Tasks
                const TaskItem(),
                const TaskItem(),
                const TaskItem(),
                const TaskItem(),
            
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: AppColors.white,
        ),
      ),
    );
  }
}

