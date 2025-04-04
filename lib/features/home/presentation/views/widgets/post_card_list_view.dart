import 'package:flutter/material.dart';
import 'package:linkdin_app/constatns.dart';
import 'package:linkdin_app/core/models/post_model.dart';
import 'package:linkdin_app/features/home/presentation/views/widgets/post_card.dart';

class PostCardListView extends StatelessWidget {
  const PostCardListView({required this.posts, super.key});

  final List<PostModel> posts;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        child: ListView.builder(
            padding: EdgeInsets.symmetric(
              horizontal: kPaddingHorizontal,
              vertical: 18,
            ),
            // physics: NeverScrollableScrollPhysics(),
            // shrinkWrap: true,
            itemCount: posts.length,
            // reverse: true,
            itemBuilder: (context, index) {
              return PostCard(
                postModel: posts[index],
              );
            }),
      ),
    );
  }
}
