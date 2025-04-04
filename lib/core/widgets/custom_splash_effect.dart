import 'package:flutter/material.dart';
import 'package:linkdin_app/constatns.dart';
import 'package:linkdin_app/core/functions/calcul_opacity.dart';
import 'package:linkdin_app/core/utils/app_colors.dart';

class CustomSplashEffect extends StatelessWidget {
  const CustomSplashEffect({
    super.key,
    required this.child,
    required this.onTap,
    this.border,
    this.padding = const EdgeInsets.all(0),
    this.radius = 0,
    this.color,
  });

  final Widget child;
  final BoxBorder? border;
  final VoidCallback onTap;
  final EdgeInsetsGeometry padding;
  final double radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Material(
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kDefaultBorderRadius),
            border: border,
            color: color ?? AppColors.primaryColor,
          ),
          child: Padding(
            padding: padding,
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(kDefaultBorderRadius),
              splashColor: Theme.of(context).brightness == Brightness.light
                  ? AppColors.primaryColor.withAlpha(calculeOpacity(.3))
                  : AppColors.secondaryColor.withAlpha(calculeOpacity(.3)),
              highlightColor: Theme.of(context).brightness == Brightness.light
                  ? AppColors.primaryColor.withAlpha(calculeOpacity(.1))
                  : AppColors.secondaryColor.withAlpha(calculeOpacity(.1)),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
