import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:linkdin_app/constatns.dart';
import 'package:linkdin_app/core/utils/app_colors.dart';
import 'package:linkdin_app/core/utils/styles.dart';
import 'package:linkdin_app/core/widgets/custom_splash_effect.dart';

class CurrencyCategoryCard extends StatelessWidget {
  const CurrencyCategoryCard({
    super.key,
    required this.title,
    this.icon,
    this.onTap,
    required this.isActive,
  });

  final String title;
  final IconData? icon;
  final VoidCallback? onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return CustomSplashEffect(
      onTap: onTap ?? () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        // width: MediaQuery.of(context).size.width * .2,
        decoration: BoxDecoration(
          color: isActive ? AppColors.primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(kDefaultBorderRadius),
          border: Border.all(
            color: AppColors.primaryColor,
            width: .5,
          ),
        ),
        child: Center(
          child: icon != null
              ? Icon(
                  icon,
                  color: isActive
                      ? AppColors.primaryColor
                      : AppColors.tertialyColor,
                  size: kDefaultIconsSize,
                )
              : AutoSizeText(
                  title,
                  maxLines: 1,
                  style: AppStyles.style13.copyWith(
                    fontWeight: FontWeight.w600,
                    color: isActive ? Colors.white : AppColors.dark2,
                  ),
                ),
        ),
      ),
    );
  }
}
