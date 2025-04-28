import 'package:flutter_atividade/models/post.dart';

class User {
  final String name;
  final String password;
  final String profilePicture;
  final List<Post>? post;

  User({
    required this.name,
    required this.password,
    required this.profilePicture,
    this.post,
  });
}
