import 'package:flutter/material.dart';
import 'package:linkdin_app/core/functions/calcul_opacity.dart';
import 'package:linkdin_app/core/utils/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomAnimatedPageIndicator extends StatelessWidget {
  const CustomAnimatedPageIndicator({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return AnimatedSmoothIndicator(
      axisDirection: Axis.horizontal,
      activeIndex: currentIndex,
      count: 3,
      effect: ExpandingDotsEffect(
        dotHeight: 8,
        dotWidth: 8,
        activeDotColor: AppColors.primaryColor,
        dotColor: AppColors.primaryColor.withAlpha(calculeOpacity(.3)),
      ),
    );
  }
}
