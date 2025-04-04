// import 'package:flutter/material.dart';
// import 'package:hackathon_app/core/utils/app_colors.dart';
// import 'package:hackathon_app/core/utils/styles.dart';

// class CustomExpandedTextFormField extends StatelessWidget {
//   const CustomExpandedTextFormField({
//     super.key,
//     required this.hint,
//     this.onChanged,
//     this.keyboardType,
//     this.onPressed,
//     this.onSaved,
//     this.controller,
//     this.validator,
//     this.obscureText = false,
//   });

//   final Function(String?)? onSaved;
//   final String hint;
//   final void Function(String?)? onChanged;
//   final TextInputType? keyboardType;
//   final void Function()? onPressed;
//   final TextEditingController? controller;
//   final bool obscureText;

//   final FormFieldValidator? validator;
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       child: ConstrainedBox(
//         constraints: const BoxConstraints(
//           maxHeight: 300.0,
//         ),
//         child: TextFormField(
//           enableSuggestions: false,
//           obscureText: obscureText,
//           autocorrect: false,
//           controller: controller,
//           onSaved: onSaved,
//           validator: validator,
//           onChanged: onChanged,
//           keyboardType: keyboardType,
//           cursorColor: Colors.black12,
//           minLines: 6,
//           maxLines: null,
//           style: Styles.style16.copyWith(fontWeight: FontWeight.w400),
//           decoration: InputDecoration(
//             filled: true,
//             fillColor: AppColors.whiteNormalHover.withOpacity(.2),
//             contentPadding: const EdgeInsets.only(
//                 bottom: 14.5, top: 14.5, left: 16, right: 16),
//             hintText: hint,
//             hintTextDirection: TextDirection.rtl,
//             hintStyle: Styles.style16.copyWith(
//               color: AppColors.whiteDarkHover,
//               fontWeight: FontWeight.w400,
//             ),
//             border: buildBorder(color: AppColors.whiteNormalHover),
//             enabledBorder: buildBorder(color: AppColors.whiteNormalHover),
//             focusedBorder: buildBorder(color: AppColors.whiteNormalHover),
//           ),
//         ),
//       ),
//     );
//   }

//   OutlineInputBorder buildBorder({required Color color}) {
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10),
//       borderSide: BorderSide(
//         color: color,
//       ),
//     );
//   }
// }
