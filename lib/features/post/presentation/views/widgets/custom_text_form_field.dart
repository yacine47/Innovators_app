import 'package:flutter/material.dart';
import 'package:linkdin_app/core/functions/validator.dart';
import 'package:linkdin_app/core/utils/app_colors.dart';
import 'package:linkdin_app/core/utils/styles.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({
    super.key,
    this.maxLines = 1,
    required this.hint,
    this.onChanged,
    // this.controller,

    this.keyboardType = TextInputType.text,
    this.onPressed,
    this.suffixIcon,
    required this.prefixIcon,
    this.onSaved,
    this.borderColor = AppColors.grey4,
    this.borderRaduis = 12,
    this.contentPadding =
        const EdgeInsets.only(bottom: 18, top: 18, left: 18, right: 18),
    this.autofocus = false,
    this.onFieldSubmitted,
  });
  // final TextEditingController? controller;
  final int maxLines;
  final Color borderColor;
  final double borderRaduis;
  final String hint;
  final void Function(String?)? onChanged;
  final TextInputType? keyboardType;
  final void Function()? onPressed;
  final IconData? suffixIcon;
  final IconData prefixIcon;
  final Function(String?)? onSaved;
  final EdgeInsetsGeometry contentPadding;
  final bool autofocus;
  final void Function(String)? onFieldSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      validator: validator,
      onChanged: onChanged,
      keyboardType: keyboardType,
      cursorColor: Colors.black12,
      decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.grey4,
          // MyColors.textFieldColor

          suffixIcon: suffixIcon != null
              ? IconButton(
                  onPressed: onPressed,
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Icon(
                      suffixIcon,
                      size: 20,
                    ),
                  ),
                )
              : const SizedBox(),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 20, right: 12),
            child: Icon(
              prefixIcon,
              color: AppColors.dark,
              size: 20,
            ),
          ),
          contentPadding: contentPadding,
          hintText: hint,
          label: Text(
            hint,
            style: AppStyles.style14,
          ),
          hintStyle: TextStyle(
            color: AppColors.grey4,
          ),
          border: buildBorder(),
          enabledBorder: buildBorder(color: borderColor),
          focusedBorder: buildBorder(color: borderColor)),
    );
  }

  OutlineInputBorder buildBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRaduis),
      borderSide: BorderSide(
        color: color ?? Colors.white,
      ),
    );
  }
}
