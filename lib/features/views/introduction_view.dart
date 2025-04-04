import 'package:flutter/material.dart';
import 'package:linkdin_app/core/utils/app_colors.dart';
import 'package:linkdin_app/features/views/widgets/introduction_view_body.dart';

class IntroductionView extends StatelessWidget {
  const IntroductionView({super.key});

  static String path = '/IntroductionView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      // appBar: AppBar(),
      body: IntroductionViewBody(),
    );
  }
}
