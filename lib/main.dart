import 'package:flutter/material.dart';
import 'package:flutter_atividade/models/post.dart';
import 'package:flutter_atividade/models/user.dart';
import 'package:flutter_atividade/objectbox.g.dart';
import 'package:flutter_atividade/ui/screens/login.dart';
import 'objectbox.dart';

late ObjectBox objectbox;
late Box<User> userBox;
late Box<Post> postBox;
late Box<Post> vagasBox;

void main() async {
  objectbox = await ObjectBox.create();
  userBox = objectbox.store.box<User>();
  postBox = objectbox.store.box<Post>();
  vagasBox = objectbox.store.box<Post>();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      home: const LoginPage(),
    );
  }
}
