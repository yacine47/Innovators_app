import 'package:hive/hive.dart';
import 'package:linkdin_app/core/models/comment_model.dart';
import 'package:linkdin_app/core/models/user_model.dart';

part 'post_model.g.dart';

@HiveType(typeId: 1)
class PostModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String userId;

  @HiveField(2)
  final String caption;

  @HiveField(3)
  final String? imageUrl;

  @HiveField(4)
  final List<CommentModel> comments;

  @HiveField(5)
  final List<UserModel> likes;

  @HiveField(6)
  final bool isSimplePost;

  @HiveField(7)
  final DateTime createdAt;

  @HiveField(8)
  List<UserModel> usersInv;

  // Optionally store user cache for faster display
  @HiveField(9)
  final String username;

  @HiveField(10)
  final String userAvatar;

  @HiveField(11)
  final String category;

  @HiveField(12)
  final double? targetAmount;

  @HiveField(13)
  double? raisedAmount;

  @HiveField(14)
  String? status;

  @HiveField(15)
  String? postType; // 'normal', 'donate', 'idea'

  PostModel(
      {required this.id,
      required this.userId,
      required this.caption,
      required this.imageUrl,
      required this.comments,
      required this.likes,
      required this.isSimplePost,
      required this.createdAt,
      required this.usersInv,
      required this.username,
      required this.userAvatar,
      required this.category,
      this.postType,
      this.raisedAmount,
      this.status,
      this.targetAmount});
}

List<PostModel> posts = [
  PostModel(
    likes: [],
    comments: [],
    id: "1", // Use a unique ID for each post
    userId: "1", // Use the ID of the user who posted
    username: "Tony",
    userAvatar: "https://i.ytimg.com/vi/9snfz2sQMFQ/maxresdefault.jpg",
    caption:
        "Hey there I am using LinkedIn. Hey there I am using LinkedIn. Hey there I am using LinkedIn. Hey there I am using LinkedIn. Hey there I am using LinkedIn. Hey there I am using LinkedIn. Hey there I am using LinkedIn.",
    imageUrl:
        'https://images.unsplash.com/photo-1593642634524-b40b5baae6bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2689&q=80',

    isSimplePost: true, // Assuming it’s not just text
    createdAt: DateTime.now(),
    usersInv: [], category: 'Article', // Optional: you can add users to invite
  ),
  PostModel(
    category: 'Article', // Optional: you can add users to invite
    likes: [],
    comments: [],
    id: "2",
    userId: "1",
    username: "Tony",
    userAvatar: "https://i.ytimg.com/vi/9snfz2sQMFQ/maxresdefault.jpg",
    caption: "Hey there I am using LinkedIn.",
    imageUrl:
        'https://images.unsplash.com/photo-1593642634524-b40b5baae6bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2689&q=80',
    isSimplePost: true,
    createdAt: DateTime.now(),
    usersInv: [],
  ),
];
