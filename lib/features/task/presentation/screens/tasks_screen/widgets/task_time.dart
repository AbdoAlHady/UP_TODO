import 'package:flutter/material.dart';
  import 'package:todo_app/core/helpers/spacing.dart';
import 'package:todo_app/core/widgets/app_text_form_field.dart';

class TaskTime extends StatelessWidget {
  const TaskTime({
    super.key,
    required this.title,
    this.onTap, required this.hint,
  });
  final String title;
  final VoidCallback? onTap;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleSmall),
          verticalSapce(10),
          AppTextFormField(
            hintText: hint,
            readOnly: true,
            suffixIcon: GestureDetector(
                onTap: onTap, child: const Icon(Icons.timer_outlined)),
          ),
        ],
      ),
    );
  }
}
