import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:linkdin_app/core/utils/app_colors.dart';
import 'package:linkdin_app/core/utils/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.maxLines = 1,
    required this.hint,
    this.onChanged,
    this.inputFormatters,
    this.keyboardType,
    this.onPressed,
    this.onSaved,
    this.controller,
    this.minLines,
    this.validator,
    this.obscureText = false,
    this.focusNode,
    this.borderColor = AppColors.grey04,
  });

  final int maxLines;
  final int? minLines;
  final Function(String?)? onSaved;
  final String hint;
  final void Function(String?)? onChanged;
  final TextInputType? keyboardType;
  final void Function()? onPressed;
  final TextEditingController? controller;
  final bool obscureText;
  final FocusNode? focusNode;
  final Color borderColor;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      focusNode: focusNode,
      textDirection: TextDirection.ltr,
      enableSuggestions: false,
      obscureText: obscureText,
      autocorrect: false,
      controller: controller,
      onSaved: onSaved,
      validator: validator,
      onChanged: onChanged,
      keyboardType: keyboardType,
      cursorColor: Colors.black12,
      minLines: minLines,
      maxLines: maxLines,
      style: AppStyles.style16.copyWith(fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.grey12.withOpacity(.2),
        contentPadding:
            const EdgeInsets.only(bottom: 14.5, top: 14.5, left: 16, right: 16),
        hintText: hint,
        hintTextDirection: TextDirection.ltr,
        hintStyle: AppStyles.style16.copyWith(
          color: AppColors.grey04,
          fontWeight: FontWeight.w400,
        ),
        border: buildBorder(color: borderColor),
        enabledBorder: buildBorder(color: borderColor),
        focusedBorder: buildBorder(color: borderColor),
      ),
    );
  }

  OutlineInputBorder buildBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: color,
      ),
    );
  }
}
