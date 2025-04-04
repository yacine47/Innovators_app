import 'package:flutter/widgets.dart';
import 'package:linkdin_app/constatns.dart';
import 'package:linkdin_app/core/widgets/custom_button.dart';
import 'package:linkdin_app/features/payment/presentation/views/widgets/payment_form_info.dart';
import 'package:linkdin_app/features/payment/presentation/views/widgets/payment_methods.dart';

class PaymentViewBody extends StatelessWidget {
  const PaymentViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: h * 0.05),
          PaymentMethods(),
          SizedBox(height: h * 0.02),
          PaymentFormInfo(),
          SizedBox(height: h * 0.03),
          CustomButton(
            paddingHor: kPaddingHorizontal,
            onPressed: () {},
            title: 'Pay',
          ),
          SizedBox(height: h * 0.02),
        ],
      ),
    );
  }
}
