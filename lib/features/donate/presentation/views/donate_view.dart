import 'package:flutter/material.dart';
import 'package:linkdin_app/features/donate/presentation/views/widgets/donate_view_body.dart';

class DonateView extends StatelessWidget {
  const DonateView({super.key});
  static const String path = '/DonateView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DonateViewBody(),
      ),
    );
  }
}
