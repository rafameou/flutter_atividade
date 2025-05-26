import 'package:flutter_atividade/models/post.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class User {
  int id = 0;
  final String name;
  final String password;
  final String profilePicture;
  //final List<Post>? post;
  final post = ToMany<Post>();
  final vagas = ToMany<Post>();

  User({
    required this.name,
    required this.password,
    required this.profilePicture,
  });
}
