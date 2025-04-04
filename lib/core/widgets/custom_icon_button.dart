import 'package:flutter/material.dart';
import 'package:linkdin_app/constatns.dart';
import 'package:linkdin_app/core/utils/app_colors.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    this.size = kDefaultIconsSize,
    required this.onTap,
    this.color = AppColors.primaryColor,
    this.flip = false,
    this.flip90 = false,
    this.padding = EdgeInsets.zero,
  });

  final IconData icon;
  final double size;
  final VoidCallback onTap;
  final Color color;
  final bool flip;
  final bool flip90;

  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: padding,
        child: Transform(
          alignment: Alignment.center,
          transform: flip90
              ? Matrix4.rotationZ(270 * 3.1415927 / 180)
              : flip
                  ? Matrix4.rotationY(3.14159)
                  : Matrix4.identity(),
          child: IconButton(
            onPressed: onTap,
            icon: Icon(
              icon,
              size: size,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
