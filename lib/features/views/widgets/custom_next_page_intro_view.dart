import 'package:flutter/material.dart';

import 'package:linkdin_app/core/utils/app_colors.dart';

class CustomNextPageIntroView extends StatelessWidget {
  const CustomNextPageIntroView({
    super.key,
    this.onTap,
  });

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        backgroundColor: AppColors.primaryColor,
        radius: 26,
        child: Icon(
          Icons.arrow_forward_ios,
          size: 24,
          color: AppColors.white,
        ),
      ),
    );
  }
}
