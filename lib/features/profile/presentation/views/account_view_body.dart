import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:linkdin_app/constatns.dart';
import 'package:linkdin_app/core/widgets/custom_button.dart';
import 'package:linkdin_app/features/profile/presentation/views/setting_items_list_view.dart';
import 'package:linkdin_app/features/auth/presentation/views/login_view.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    final double hightDevice = MediaQuery.of(context).size.height;

    // final List<SettingItemModel> settingAccount = [
    //   SettingItemModel(
    //     title: 'الحساب الشخصي',
    //     icon: AppIcons.userLight,
    //     onTap: () {},
    //   ),
    //   SettingItemModel(
    //     title: 'الامان',
    //     icon: AppIcons.lock,
    //     onTap: () {},
    //   ),
    // ];

    final List<SettingItemModel> otherSettings = [
      // SettingItemModel(
      //   title: 'اللغة',
      //   icon: AppIcons.language,
      //   onTap: () {},
      // ),
      SettingItemModel(
        title: 'Help Center',
        icon: Icons.support,
        onTap: () {
          // GoRouter.of(context).push(HelpCenterView.path);
        },
      ),
      SettingItemModel(
        title: 'Terms and Conditions',
        icon: Icons.file_copy,
        onTap: () {
          // GoRouter.of(context).push(TermsView.path);
        },
      ),
    ];

    final List<SettingItemModel> familySetting = [
      SettingItemModel(
        title: 'انضمام الى العائلة',
        icon: Icons.family_restroom,
        onTap: () {
          // GoRouter.of(context).push(JoinFamilyView.path);
        },
      ),
    ];
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: hightDevice * .02),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
            child: Column(
              children: [
                // SizedBox(height: hightDevice * .02),
                // const CustomTitleScetions(
                //   title: 'اخرى',
                //   fontSize: 19,
                //   color: AppColors.black,
                // ),
                SizedBox(height: hightDevice * .02),
                SettingItemsListView(
                  settingItems: otherSettings,
                ),
                SizedBox(height: hightDevice * .01),
                // SettingItemsListView(
                //   settingItems: familySetting,
                // ),
                SizedBox(height: hightDevice * .03),
                // BlocConsumer<LogoutCubit, LogoutState>(
                //   listener: (context, state) {
                //     if (state is LogoutSuccess) {
                //       GoRouter.of(context).go(LoginView.path);
                //     }
                //   },
                //   builder: (context, state) {
                //     return
                //   },
                // )
                CustomButton(
                  title: 'Logout',
                  // isLoading: state is LogoutLoading,
                  onPressed: () {
                    GoRouter.of(context).go(LoginView.path);
                    // BlocProvider.of<LogoutCubit>(context).logout();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SettingItemModel {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  SettingItemModel({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}
