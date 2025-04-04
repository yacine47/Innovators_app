import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:linkdin_app/constatns.dart';
import 'package:linkdin_app/core/models/post_model.dart';
import 'package:linkdin_app/core/models/comment_model.dart';

class PostCard extends StatefulWidget {
  const PostCard({super.key, required this.postModel});
  final PostModel postModel;

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool showCommentField = false;
  final TextEditingController _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _toggleCommentField() {
    setState(() {
      showCommentField = !showCommentField;
    });
  }

  void _sendComment() {
    final comment = _commentController.text.trim();
    if (comment.isNotEmpty) {
      widget.postModel.comments.add(CommentModel(
        comment: comment,
        createdAt: DateTime.now(),
        userModel: Hive.box(kSettingsBox).get('user'),
      ));
      widget.postModel.save();
      _commentController.clear();
      setState(() {
        showCommentField = false;
      });
    }
  }

  String formattedCreatedAt(DateTime dateTime) {
    return DateFormat('MMM dd, yyyy – hh:mm a').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    final user = Hive.box(kSettingsBox).get('user');

    // Indicator for post type
    Widget postTypeIndicator() {
      if (widget.postModel.category.toLowerCase() == 'donate') {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            'Donate Post',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        );
      } else if (widget.postModel.category.toLowerCase() == 'idea') {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            'Investment Idea',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        );
      } else {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            'Simple Post',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        );
      }
    }

    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.postModel.userAvatar),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.postModel.username,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      formattedCreatedAt(widget.postModel.createdAt),
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Post Type Indicator
          Padding(
            padding: EdgeInsets.only(left: 10, bottom: 8),
            child: postTypeIndicator(),
          ),

          /// Caption
          if (widget.postModel.caption.isNotEmpty)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(widget.postModel.caption),
            ),

          /// Image
          if (widget.postModel.imageUrl != null)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: FadeInImage(
                image: NetworkImage(widget.postModel.imageUrl!),
                placeholder: NetworkImage(widget.postModel.imageUrl!),
              ),
            ),

          SizedBox(height: 10),

          /// Donation or Idea Progress Section
          if (widget.postModel.category.toLowerCase() == 'donate' ||
              widget.postModel.category.toLowerCase() == 'idea')
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Raised: \$${widget.postModel.raisedAmount?.toStringAsFixed(2) ?? "0"} / \$${widget.postModel.targetAmount?.toStringAsFixed(2) ?? "0"}",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 4),
                  LinearProgressIndicator(
                    value: (widget.postModel.raisedAmount ?? 0) /
                        (widget.postModel.targetAmount ?? 1),
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(
                      (widget.postModel.raisedAmount ?? 0) >=
                              (widget.postModel.targetAmount ?? 1)
                          ? Colors.green
                          : Colors.blue,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Status: ${widget.postModel.status ?? "Open"}",
                    style: TextStyle(
                        fontSize: 12,
                        color: (widget.postModel.status ?? "").toLowerCase() ==
                                "closed"
                            ? Colors.red
                            : Colors.green),
                  ),
                ],
              ),
            ),

          SizedBox(height: 10),

          /// Likes & Comments count
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.thumb_up, size: 16, color: Colors.blue),
                    SizedBox(width: 4),
                    Text(widget.postModel.likes.length.toString()),
                  ],
                ),
                Text("${widget.postModel.comments.length} comments",
                    style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),

          Divider(),

          /// Like & Comment buttons
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      if (widget.postModel.likes.contains(user)) {
                        widget.postModel.likes.remove(user);
                      } else {
                        widget.postModel.likes.add(user);
                      }
                      widget.postModel.save();
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.thumb_up_outlined,
                          color: widget.postModel.likes.contains(user)
                              ? Colors.blue
                              : Colors.black),
                      SizedBox(width: 4),
                      Text(
                        "Like",
                        style: TextStyle(
                            color: widget.postModel.likes.contains(user)
                                ? Colors.blue
                                : Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: _toggleCommentField,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.message_outlined),
                      SizedBox(width: 4),
                      Text("Comment"),
                    ],
                  ),
                ),
              ),
            ],
          ),

          /// Comment Input Field
          if (showCommentField)
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _commentController,
                      decoration: InputDecoration(
                        hintText: "Write a comment...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: _sendComment,
                    icon: Icon(Icons.send, color: Colors.blue),
                  ),
                ],
              ),
            ),

          /// Comments List
          if (widget.postModel.comments.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: widget.postModel.comments.map((comment) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundImage:
                              NetworkImage(comment.userModel.profileImageUrl),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  comment.userModel.name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                                SizedBox(height: 4),
                                Text(comment.comment),
                                SizedBox(height: 4),
                                Text(
                                  formattedCreatedAt(comment.createdAt),
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
        ],
      ),
    );
  }
}
