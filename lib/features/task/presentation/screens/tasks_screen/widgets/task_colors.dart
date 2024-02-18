import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/core/utils/app_colors.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/utils/app_strings.dart';

class TaskColors extends StatefulWidget {
  const TaskColors({
    super.key,
  });

  @override
  State<TaskColors> createState() => _TaskColorsState();
}

class _TaskColorsState extends State<TaskColors> {
  int currentIndex = 0;
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
        SizedBox(
          height: 40.h,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  child: CircleAvatar(
                    backgroundColor: getColor(index),
                    child:currentIndex==index? const Icon(Icons.check):null,
                  ),
                );
              },
              separatorBuilder: (context, index) => horizontalSpace(8),
              itemCount: 6),
        )
      ],
    );
  }

  Color getColor(index) {
    switch (index) {
      case 0:
        return AppColors.red;
      case 1:
        return AppColors.green;
      case 2:
        return AppColors.blueGrey;
      case 3:
        return AppColors.blue;
      case 4:
        return AppColors.purple;
      case 5:
        return AppColors.orange;
      default:
        return AppColors.grey;
    }
  }
}
