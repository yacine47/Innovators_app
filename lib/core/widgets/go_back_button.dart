import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:linkdin_app/constatns.dart';
import 'package:linkdin_app/core/widgets/custom_icon_button.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GoRouter.of(context).canPop()
        ? Builder(
            builder: (context) => CustomIconButton(
              onTap: () {
                GoRouter.of(context).pop();
              },
              icon: Icons.arrow_back_ios_new_rounded,
              size: kDefaultIconsSize * 1,
              color: Colors.white,
            ),
          )
        : SizedBox();
  }
}
