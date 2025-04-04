import 'package:flutter/material.dart';
import 'package:linkdin_app/features/payment/presentation/views/widgets/app_bar_payement_view.dart';
import 'package:linkdin_app/features/payment/presentation/views/widgets/payment_view_body.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({super.key});
  static const String path = '/PaymentView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarPayementView(),
      body: SafeArea(
        child: PaymentViewBody(),
      ),
    );
  }
}
