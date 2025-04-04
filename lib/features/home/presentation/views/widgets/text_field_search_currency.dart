import 'package:flutter/material.dart';
import 'package:linkdin_app/core/utils/app_colors.dart';
import 'package:linkdin_app/core/utils/styles.dart';

class TextFieldSearchCurrency extends StatelessWidget {
  const TextFieldSearchCurrency({
    super.key,
    this.maxLines = 1,
    required this.hint,
    this.onChanged,
    this.keyboardType,
    this.onPressed,
    this.controller,
    this.minLines,
    this.focusNode,
  });

  final int maxLines;
  final int? minLines;
  final String hint;
  final void Function(String?)? onChanged;
  final TextInputType? keyboardType;
  final void Function()? onPressed;
  final FocusNode? focusNode;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      width: MediaQuery.of(context).size.width * .7,
      child: TextField(
        focusNode: FocusNode(),
        enableSuggestions: false,
        controller: controller,
        onChanged: onChanged,
        keyboardType: keyboardType,
        cursorColor: Theme.of(context).brightness == Brightness.light
            ? AppColors.grey12
            : AppColors.grey12,
        minLines: minLines,
        maxLength: 15,
        maxLines: maxLines,
        style: AppStyles.style18.copyWith(
          fontWeight: FontWeight.w500,
          color: Theme.of(context).brightness == Brightness.light
              ? AppColors.grey12
              : AppColors.grey12,
          decoration: TextDecoration.none,
        ),
        decoration: InputDecoration(
          counter: Offstage(),
          focusColor: Theme.of(context).brightness == Brightness.light
              ? AppColors.grey12
              : AppColors.grey12,
          floatingLabelStyle: AppStyles.style16.copyWith(
              fontWeight: FontWeight.w500, color: AppColors.secondaryColor),
          contentPadding:
              const EdgeInsets.only(bottom: 18, top: 18, left: 18, right: 24),
          hintText: hint,
          hintStyle: AppStyles.style16.copyWith(
              fontWeight: FontWeight.w500,
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.grey12
                  : AppColors.grey11),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
