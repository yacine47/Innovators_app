import 'package:flutter/material.dart';
import 'package:linkdin_app/core/utils/app_colors.dart';
import 'package:linkdin_app/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const String path = '/SplashView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey05,
      body: SplashViewBody(),
    );
  }
}
