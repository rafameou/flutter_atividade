import 'package:flutter_atividade/models/user.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Post {
  int id = 0;
  DateTime time;
  String title;
  String text;
  String? image;
  int favorites;
  bool vaga;
  /*   List<Post>? comments = [];
  User user; */
  final user = ToOne<User>();
  final comments = ToMany<Post>();

  Post({
    required this.time,
    required this.title,
    required this.text,
    required this.vaga,
    this.image,
    required this.favorites,
  });
}
