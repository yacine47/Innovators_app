import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:linkdin_app/constatns.dart';
import 'package:linkdin_app/core/functions/date_format.dart';
import 'package:linkdin_app/core/models/comment_model.dart';
import 'package:linkdin_app/core/models/post_model.dart';

// ... your existing imports
import 'package:intl/intl.dart'; // For formatting date if needed

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

  @override
  Widget build(BuildContext context) {
    final user = Hive.box(kSettingsBox).get('user');

    return Container(
      margin: EdgeInsets.only(bottom: 10.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header (unchanged)
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.postModel.userAvatar),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.postModel.username,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                    Text(
                      formattedCreatedAt(widget.postModel.createdAt),
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Caption
          if (widget.postModel.caption.isNotEmpty)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(widget.postModel.caption),
            ),

          // Image
          if (widget.postModel.imageUrl != null)
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: FadeInImage(
                image: NetworkImage(widget.postModel.imageUrl!),
                placeholder: NetworkImage(widget.postModel.imageUrl!),
              ),
            ),

          SizedBox(height: 10),

          // Like + Comment counts
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: <Widget>[
                    Container(
                      height: 17,
                      width: 17,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child:
                          Icon(Icons.thumb_up, size: 12, color: Colors.white),
                    ),
                    SizedBox(width: 4),
                    Text(
                      widget.postModel.likes.length.toString(),
                      style: TextStyle(fontSize: 13),
                    )
                  ],
                ),
                Text(
                  "${widget.postModel.comments.length} comments",
                  style: TextStyle(color: Colors.grey[700], fontSize: 12),
                ),
              ],
            ),
          ),

          Divider(height: 20),

          // Like & Comment Buttons
          Row(
            children: <Widget>[
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
                    children: <Widget>[
                      Icon(
                        Icons.thumb_up_outlined,
                        size: 20,
                        color: widget.postModel.likes.contains(user)
                            ? Colors.blue
                            : Colors.black,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Like",
                        style: TextStyle(
                          color: widget.postModel.likes.contains(user)
                              ? Colors.blue
                              : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: _toggleCommentField,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.message_outlined),
                      SizedBox(width: 5),
                      Text("Comment"),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Comment input
          if (showCommentField)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
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

          // Comments list
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
                                    fontSize: 13,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  comment.comment,
                                  style: TextStyle(fontSize: 14),
                                ),
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
