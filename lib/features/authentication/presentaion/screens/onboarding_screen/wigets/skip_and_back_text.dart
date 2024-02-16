import 'package:flutter/material.dart';

import '../../../../../../core/theme/text_styles.dart';

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
          style: TextStyles.font16WhiteRegular,
        ),
      ),
    );
  }
}
