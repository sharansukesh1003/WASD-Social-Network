import 'package:flutter_instagram_custom_ui/models/user_model';

class Post {
  String imageUrl;
  User author;
  String title;
  String location;
  int likes;
  int comments;

  Post({
    required this.imageUrl,
    required this.author,
    required this.title,
    required this.location,
    required this.likes,
    required this.comments,
  });
}
