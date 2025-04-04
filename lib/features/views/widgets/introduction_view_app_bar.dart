import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:linkdin_app/constatns.dart';
import 'package:linkdin_app/core/utils/styles.dart';
import 'package:linkdin_app/features/auth/presentation/views/login_view.dart';

class IntroductionViewAppBar extends StatelessWidget {
  const IntroductionViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
      child: Row(
        children: [
          // Iconify(
          //   MyIcons.goBackIcon,
          //   size: 32,
          // ),
          const SizedBox(),
          const Spacer(),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).go(LoginView.path);
            },
            child: Text(
              'Skip',
              style: AppStyles.style18.copyWith(fontWeight: FontWeight.w600),
              textDirection: TextDirection.ltr,
            ),
          )
        ],
      ),
    );
  }
}
