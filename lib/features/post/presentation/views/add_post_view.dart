import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:linkdin_app/features/post/presentation/views/widgets/add_post_view_body.dart';
import 'package:linkdin_app/features/post/presentation/views/widgets/app_bar_add_post.dart';

class AddPostView extends StatelessWidget {
  const AddPostView({super.key});
  static const String path = '/AddPostView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarAddPostView(),
      body: SafeArea(
        child: AddPostViewBody(),
      ),
    );
  }
}
