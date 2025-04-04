import 'package:flutter/material.dart';
import 'package:linkdin_app/core/utils/app_colors.dart';
import 'package:linkdin_app/core/utils/styles.dart';
import 'package:linkdin_app/features/profile/presentation/views/account_view_body.dart';

class SettingItemWidget extends StatelessWidget {
  const SettingItemWidget({super.key, required this.settingItem});
  final SettingItemModel settingItem;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: settingItem.onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 14.5),
        child: Row(
          children: [
            Icon(
              settingItem.icon,
              color: AppColors.primaryColor,
              size: 22,
            ),
            const SizedBox(width: 11),
            Text(
              settingItem.title,
              style: AppStyles.style13.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
