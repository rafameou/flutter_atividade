import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:flutter_atividade/models/post.dart';

abstract class PostRepository extends ChangeNotifier {
  List<Post> get posts;
  void addPost(Post post);
}

class PostRepositoryMemory extends ChangeNotifier implements PostRepository {
  final List<Post> _posts = [];
  String notification = '';

  @override
  List<Post> get posts => UnmodifiableListView(_posts);

  @override
  void addPost(Post post) {
    _posts.add(post);
    notification = 'Produto inserido!';
    notifyListeners();
  }
}
