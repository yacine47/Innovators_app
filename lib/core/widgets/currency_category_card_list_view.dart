import 'package:flutter/material.dart';
import 'package:linkdin_app/constatns.dart';
import 'package:linkdin_app/core/widgets/currency_category_card.dart';

class CurrencyCategoryCardListView extends StatefulWidget {
  const CurrencyCategoryCardListView(
      {super.key, required this.tabController, required this.categories});
  final TabController tabController;
  final List<String> categories;
  @override
  State<CurrencyCategoryCardListView> createState() =>
      _CurrencyCategoryCardListViewState();
}

class _CurrencyCategoryCardListViewState
    extends State<CurrencyCategoryCardListView> {
  final ScrollController _scrollController = ScrollController();
  int currentIndex = 0;

  @override
  void initState() {
    widget.tabController.animation?.addListener(() {
      setState(() {
        currentIndex = widget.tabController.animation!.value.round();
        scrollCategory(currentIndex);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.only(
        top: 30,
        bottom: 10,
      ),
      child: Container(
        // padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        height: kHeightTabsButtons,
        child: ListView.separated(
          controller: _scrollController,
          padding: EdgeInsets.symmetric(horizontal: kPaddingHorizontal),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => CurrencyCategoryCard(
            title: widget.categories[index],
            isActive: index == currentIndex,
            onTap: () {
              widget.tabController.animateTo(index,
                  duration: const Duration(milliseconds: 300));

              setState(() {
                currentIndex = index;
              });
              scrollCategory(index);
            },
          ),
          separatorBuilder: (context, index) => SizedBox(width: 10),
          itemCount: widget.categories.length,
        ),
      ),
    );
  }

  void scrollCategory(int index) {
    if (index == 0) {
      _scrollController.animateTo(0,
          duration: const Duration(milliseconds: 100), curve: Curves.ease);
    } else if (index == 5) {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 100), curve: Curves.ease);
    }
  }
}
