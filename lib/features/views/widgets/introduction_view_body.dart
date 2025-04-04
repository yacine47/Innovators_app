import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:linkdin_app/features/auth/presentation/views/login_view.dart';
import 'package:linkdin_app/features/views/widgets/custom_animated_page_indicator.dart';
import 'package:linkdin_app/features/views/widgets/custom_next_page_intro_view.dart';
import 'package:linkdin_app/features/views/widgets/introduction_view_app_bar.dart';
import 'package:linkdin_app/features/views/widgets/page_view_content.dart';
import 'package:linkdin_app/constatns.dart';
import 'package:linkdin_app/core/utils/app_assets.dart';

class IntroductionViewBody extends StatefulWidget {
  const IntroductionViewBody({super.key});

  @override
  State<IntroductionViewBody> createState() => _IntroductionViewBodyState();
}

class _IntroductionViewBodyState extends State<IntroductionViewBody> {
  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
  }

  int currentIndex = 0;
  late PageController _pageViewController;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 28 + MediaQuery.of(context).padding.top),
          const IntroductionViewAppBar(),
          SizedBox(height: 16),
          SizedBox(
            height: MediaQuery.of(context).size.height * .66,
            width: MediaQuery.of(context).size.width,
            child: PageView(
              onPageChanged: (value) {
                currentIndex = value;
                setState(() {});
              },
              scrollDirection: Axis.horizontal,
              controller: _pageViewController,
              children: listPagesViewContent,
            ),
          ),
          SizedBox(height: 33),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
            child: Row(
              children: [
                CustomAnimatedPageIndicator(
                  currentIndex: currentIndex,
                ),
                const Spacer(),
                CustomNextPageIntroView(
                  onTap: () {
                    if (currentIndex < 2) {
                      _pageViewController.nextPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.bounceInOut);
                      setState(() {});
                    } else {
                      GoRouter.of(context).go(LoginView.path);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> listPagesViewContent = [
    PageViewContent(
      title: 'Discover Your Social Impact Hub',
      description:
          'Welcome to your platform for social change, where you can support and invest in meaningful projects. Explore a variety of opportunities to make a difference.',
      img: AppAssets.intro_01,
    ),
    PageViewContent(
      title: 'Easy Donations & Investments',
      description:
          'With simple steps, you can browse, support, and invest in projects that align with your values anytime, anywhere.',
      img: AppAssets.intro_02,
    ),
    PageViewContent(
      title: 'Join a Community of Changemakers',
      description:
          'Become part of a network of impact-driven individuals, share insights, rate projects, and collaborate for a better future.',
      img: AppAssets.intro_04,
    ),
  ];
}
