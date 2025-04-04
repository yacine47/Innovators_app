import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:linkdin_app/core/utils/styles.dart';
import 'package:linkdin_app/core/widgets/custom_text_form_field.dart';

class CustomTextFormFieldWithTitle extends StatelessWidget {
  const CustomTextFormFieldWithTitle({
    super.key,
    required this.hint,
    required this.title,
    this.inputFormatters,
    this.onSaved,
    this.onChanged,
    this.keyboardType,
    this.controller,
    this.validator,
    this.obscureText = false,
    this.maxLines = 1,
    this.minLines,
  });
  final String hint;
  final String title;
  final int maxLines;
  final int? minLines;
  final List<TextInputFormatter>? inputFormatters;

  final Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final bool obscureText;
  final FormFieldValidator? validator;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.style16.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * .012),
        CustomTextFormField(
          controller: controller,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          obscureText: obscureText,
          onChanged: onChanged,
          onSaved: onSaved,
          validator: validator,
          minLines: minLines,
          maxLines: maxLines,
          hint: hint,
        ),
      ],
    );
  }
}
