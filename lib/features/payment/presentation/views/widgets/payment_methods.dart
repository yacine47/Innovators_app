import 'package:flutter/material.dart';
import 'package:linkdin_app/core/utils/app_assets.dart';
import 'package:linkdin_app/core/utils/app_colors.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  String? selectedOption = 'master_card';
  @override
  Widget build(BuildContext context) {
    final List<PaymentMethodModel> paymentMethods = [
      PaymentMethodModel(
        image: AppAssets.masterCard,
        title: 'Master Card',
        value: 'master_card',
      ),
      PaymentMethodModel(
        image: AppAssets.visaCard,
        title: 'Visa Card',
        value: 'visa_card',
      ),
      PaymentMethodModel(
        image: AppAssets.cib,
        title: 'CIB',
        value: 'cib',
      ),
      PaymentMethodModel(
        image: AppAssets.dahabia,
        title: 'Dahabia',
        value: 'dahabia',
      ),
    ];
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => RadioListTile<String>(
        value: paymentMethods[index].value,
        groupValue: selectedOption,
        fillColor: WidgetStateProperty.all(AppColors.primaryColor),
        title: Text(paymentMethods[index].title),
        onChanged: (value) {
          setState(() {
            selectedOption = value!;
          });
        },
        secondary: Image.asset(
          paymentMethods[index].image,
          height: 30,
        ),
      ),
      // separatorBuilder: (context, index) => SizedBox(height: 8),
      itemCount: paymentMethods.length,
    );
  }
}

class PaymentMethodModel {
  final String title;
  final String value;
  final String image;

  PaymentMethodModel({
    required this.title,
    required this.image,
    required this.value,
  });
}
