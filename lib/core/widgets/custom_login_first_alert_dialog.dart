// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:my_codes_app/core/utils/app_colors.dart';
// import 'package:my_codes_app/core/utils/styles.dart';
// import 'package:my_codes_app/features/auth/presentation/views/login_view.dart';

// class CustomLoginFirstAlertDialog extends StatelessWidget {
//   const CustomLoginFirstAlertDialog(
//       {super.key, this.onClose, this.closeBottomSheetOnLogin = true});
//   final VoidCallback? onClose;
//   final bool closeBottomSheetOnLogin;
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       elevation: 0,
//       backgroundColor: AppColors.backgroundColor,
//       title: const Text(
//         'تنبيه',
//         textAlign: TextAlign.center,
//       ),
//       content: Text(
//         'أنت لست مسجلًا، قم بتسجيل الدخول أولًا.',
//         textAlign: TextAlign.center,
//         style: Styles.style14,
//       ),
//       actions: [
//         TextButton(
//           onPressed: () {
//             Navigator.pop(context);
//             onClose?.call();
//           },
//           child: const Text('إلغاء'),
//         ),
//         TextButton(
//           onPressed: () {
//             if (closeBottomSheetOnLogin) GoRouter.of(context).pop();

//             GoRouter.of(context).push(LoginView.path, extra: true);
//           },
//           child: const Text('تسجيل الدخول'),
//         ),
//       ],
//     );
//   }
// }
