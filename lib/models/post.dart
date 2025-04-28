import 'package:flutter_atividade/models/user.dart';

class Post {
  DateTime time;
  String title;
  String text;
  String? image;
  int favorites;
  List<Post>? comments;
  User user;

  Post({
    required this.time,
    required this.title,
    required this.text,
    this.image,
    required this.favorites,
    this.comments,
    required this.user,
  });
}
