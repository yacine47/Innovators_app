import 'package:flutter/material.dart';
import 'package:linkdin_app/core/utils/app_colors.dart';
import 'package:linkdin_app/core/utils/styles.dart';
import 'package:linkdin_app/core/widgets/go_back_button.dart';

class AppBarDonateView extends StatelessWidget implements PreferredSizeWidget {
  const AppBarDonateView(
      {super.key,
      this.preferredSize = const Size.fromHeight(kToolbarHeight),
      s});

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      centerTitle: true,

      // forceMaterialTransparency: true, // leadingWidth: 36,
      leading: GoBackButton(),
      title: Text(
        'Donate',
        style: AppStyles.style20.copyWith(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      // actions: [Iconify(MyIcons.menuIcon)],
    );
  }
}
