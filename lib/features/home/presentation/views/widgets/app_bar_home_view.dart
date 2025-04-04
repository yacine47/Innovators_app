import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:linkdin_app/constatns.dart';
import 'package:linkdin_app/features/home/presentation/views/widgets/text_field_search_currency.dart';

class AppBarHomeView extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHomeView({
    super.key,
    this.preferredSize = const Size.fromHeight(kToolbarHeight),
    s,
  });

  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // brightness: Brightness.light,
      backgroundColor: Color(0XFF0e76a8),
      title: Row(
        children: [
          Container(
            padding: EdgeInsets.only(right: 15),
            child: Stack(children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 36,
                  width: 36,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[100],
                      backgroundImage: NetworkImage(
                        Hive.box(kSettingsBox).get('user').profileImageUrl
                            as String,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 17,
                  height: 17,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Icon(
                    Icons.menu,
                    color: Colors.blue,
                    size: 14,
                  ),
                ),
              )
            ]),
          ),
          TextFieldSearchCurrency(
            onChanged: (value) {
              // BlocProvider.of<SearchCurrencyCubit>(context).searchCurrency(value ?? '');
            },
            hint: "Search",
          ),
          Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 36,
                  width: 36,
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.message_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
