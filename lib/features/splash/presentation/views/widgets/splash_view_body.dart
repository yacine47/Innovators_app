import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:linkdin_app/constatns.dart';
import 'package:linkdin_app/core/models/post_model.dart';
import 'package:linkdin_app/core/models/user_model.dart';
import 'package:linkdin_app/core/utils/app_assets.dart';
import 'package:linkdin_app/features/home/presentation/views/home_view.dart';
import 'package:linkdin_app/features/views/introduction_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    initHive();

    Future.delayed(
      Duration(seconds: 2),
      () {
        GoRouter.of(context).go(
          Hive.box(kSettingsBox).get('user') == null
              ? IntroductionView.path
              : HomeView.path,
        );
      },
    );

    super.initState();
  }

  Future<void> initHive() async {
    await Hive.openBox<PostModel>(kPostsBox);
    await Hive.openBox<UserModel>(kUsersBox);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AppAssets.logo,
        width: MediaQuery.of(context).size.width * .8,
      ),
    );
  }
}
