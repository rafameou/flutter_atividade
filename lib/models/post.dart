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
  bool comment;
  final user = ToOne<User>(); // CHECAR #TODO
  final comments = ToMany<Post>(); // CHECAR #TODO

  Post({
    required this.time,
    required this.title,
    required this.text,
    required this.vaga,
    required this.comment,
    this.image,
    required this.favorites,
  });
}
