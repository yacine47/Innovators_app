import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkdin_app/constatns.dart';
import 'package:linkdin_app/core/widgets/currency_category_card_list_view.dart';
import 'package:linkdin_app/features/home/presentation/views/widgets/post_card_list_view.dart';
import 'package:linkdin_app/features/post/presentation/view_model/post_cubit/post_cubit.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({this.title, super.key});

  final String? title;

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeViewBody>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int currentIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    super.initState();

    // currentIndex = hundleStartIndex();
    // AppAnalytic.logScreenView("SelectCurrencyScreen");
    // BlocProvider.of<SearchCurrencyCubit>(context).searchCurrency('');

    _tabController.animateTo(currentIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(height: 12),
        CurrencyCategoryCardListView(
          categories: category,
          tabController: _tabController,
        ),
        // SizedBox(height: 12),

        // HeaderCard(),
        BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            if (state is PostSuccess) {
              if (currentIndex == 0) {
                return PostCardListView(
                  posts: state.posts.toList(),
                );
              }

              return PostCardListView(
                posts: state.posts
                    .where(
                      (element) => element.category == category[currentIndex],
                    )
                    .toList(),
              );
            }
            return SizedBox();
          },
        ),
      ],
    );
  }
}
