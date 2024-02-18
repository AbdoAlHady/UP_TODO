import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../core/widgets/app_text_form_field.dart';

class TaskDate extends StatefulWidget {
  const TaskDate({super.key});

  @override
  State<TaskDate> createState() => _TaskDateState();
}

class _TaskDateState extends State<TaskDate> {
   DateTime currentDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.date, style: Theme.of(context).textTheme.titleSmall),
        verticalSapce(10),
        AppTextFormField(
          readOnly: true,
          hintText: DateFormat.yMd().format(currentDate).toString(),
          suffixIcon: GestureDetector(
              onTap: () async {
                await selectDate(context);
              },
              child: const Icon(Icons.calendar_month_sharp)),
        ),
      ],
    );
  }

  Future<void> selectDate(BuildContext context) async {
     DateTime? selectedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (selectedDate != null) {
      setState(() {
        currentDate = selectedDate;
      });
    }
  }
}
