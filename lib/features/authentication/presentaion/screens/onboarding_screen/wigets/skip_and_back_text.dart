import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/app_colors.dart';

class SkipAndBackText extends StatelessWidget {
  const SkipAndBackText({
    super.key, required this.text, required this.onTap,
  });
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
         text,
          style: Theme.of(context).textTheme.titleSmall!.apply(color: AppColors.grey),
        ),
      ),
    );
  }
}
