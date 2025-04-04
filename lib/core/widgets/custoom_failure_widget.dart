import 'package:flutter/material.dart';
import 'package:linkdin_app/core/utils/styles.dart';

class CustomFailureWidget extends StatelessWidget {
  const CustomFailureWidget({
    super.key,
    required this.errMessage,
  });
  final String errMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      errMessage,
      style: AppStyles.style14.copyWith(color: Colors.red),
    ));
  }
}
