import 'package:flutter/material.dart';
import 'package:linkdin_app/core/utils/styles.dart';

class ErrMessageWidget extends StatelessWidget {
  const ErrMessageWidget(
      {super.key, required this.state, required this.isLoading});
  final dynamic state;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Align(
            alignment: Alignment.center,
            child: Text(
              state.errMessage,
              style: AppStyles.style14.copyWith(color: Colors.red),
            ),
          )
        : const SizedBox();
  }
}
