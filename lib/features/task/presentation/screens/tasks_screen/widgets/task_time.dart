import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/helpers/spacing.dart';
import 'package:todo_app/core/widgets/app_text_form_field.dart';

class TaskTime extends StatelessWidget {
  const TaskTime({
    super.key,
    required this.title, this.onTap,
  });
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleSmall),
          verticalSapce(10),
          AppTextFormField(
            hintText: DateFormat('hh:mm a').format(DateTime.now()),
            readOnly: true,
            suffixIcon: GestureDetector(
                onTap: onTap,
                child: const Icon(Icons.timer_outlined)),
          ),
        ],
      ),
    );
  }
}
