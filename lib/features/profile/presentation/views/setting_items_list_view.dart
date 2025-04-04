import 'package:flutter/material.dart';
import 'package:linkdin_app/core/utils/app_colors.dart';
import 'package:linkdin_app/features/profile/presentation/views/account_view_body.dart';
import 'package:linkdin_app/features/profile/presentation/views/setting_item_widget.dart';

class SettingItemsListView extends StatelessWidget {
  const SettingItemsListView({super.key, required this.settingItems});
  final List<SettingItemModel> settingItems;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10.5,
        horizontal: 28,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => SettingItemWidget(
          settingItem: settingItems[index],
        ),
        separatorBuilder: (context, index) => const Divider(
          color: AppColors.grey09,
          height: 0,
        ),
        itemCount: settingItems.length,
      ),
    );
  }
}
