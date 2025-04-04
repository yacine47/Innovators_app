import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:linkdin_app/core/utils/app_colors.dart';
import 'package:linkdin_app/core/widgets/custom_app_bar.dart';
import 'package:linkdin_app/features/contribution/presentation/views/widgets/contribution_view_body.dart';
import 'package:linkdin_app/features/donate/presentation/views/widgets/donate_view_body.dart';
import 'package:linkdin_app/features/home/presentation/views/widgets/app_bar_home_view.dart';
import 'package:linkdin_app/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:linkdin_app/features/home/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:linkdin_app/features/post/presentation/views/add_post_view.dart';
import 'package:linkdin_app/features/profile/presentation/views/account_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({this.title, super.key});

  static const String path = '/HomeView';

  final String? title;

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  Widget _widgetBody = HomeViewBody();
  int _currrentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) async {
    setState(() {
      if (index == 0) {
        _currrentIndex = index;
        _widgetBody = HomeViewBody();
      } else if (index == 1) {
        _currrentIndex = index;
        _widgetBody = ContributionViewBody();
      } else if (index == 2) {
        GoRouter.of(context).push(AddPostView.path);
      } else if (index == 3) {
        _currrentIndex = index;
        _widgetBody = DonateViewBody();
      } else if (index == 4) {
        _currrentIndex = index;
        _widgetBody = AccountViewBody();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroungToastColor,
      appBar: _buildAppBar(_currrentIndex),
      body: _widgetBody,
      bottomNavigationBar: CustomBottomNavigationBar(
        onItemTapped: _onItemTapped,
        currrentIndex: _currrentIndex,
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(int index) {
    if (index == 0) {
      return AppBarHomeView();
    } else if (index == 1) {
      _currrentIndex = index;
      return CustomAppBar(
        title: 'Contribution',
      );
    } else if (index == 2) {
      GoRouter.of(context).push(AddPostView.path);
    } else if (index == 3) {
      return CustomAppBar(title: 'Donate');
    } else if (index == 4) {
      return CustomAppBar(
        title: 'Account',
      );
    }

    return AppBarHomeView();
  }
}
