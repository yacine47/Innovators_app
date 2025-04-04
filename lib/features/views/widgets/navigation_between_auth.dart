import 'package:flutter/material.dart';
import 'package:linkdin_app/core/utils/app_colors.dart';
import 'package:linkdin_app/core/utils/styles.dart';

class NavigationBetweenAuth extends StatelessWidget {
  const NavigationBetweenAuth({
    super.key,
    required this.text,
    required this.textSpan,
    this.onTap,
  });

  final String text;
  final String textSpan;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Text(textSpan,
              style: AppStyles.style12.copyWith(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w900,
              )),
        ),
        const SizedBox(width: 6),
        Text(text, style: AppStyles.style12),
      ],
    );
  }
}
