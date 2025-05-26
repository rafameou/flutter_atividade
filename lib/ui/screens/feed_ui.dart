import 'package:flutter/material.dart';
import 'package:flutter_atividade/models/post.dart';
import 'package:flutter_atividade/ui/widgets/appbar.dart';
import 'package:flutter_atividade/ui/widgets/appbar_button.dart';
import 'package:flutter_atividade/ui/screens/create_post_feed.dart';
import 'package:flutter_atividade/ui/screens/jobs_ui.dart';
import 'package:flutter_atividade/ui/screens/notifications_ui.dart';
import 'package:flutter_atividade/ui/widgets/post_ui.dart';
import 'package:flutter_atividade/models/user.dart';
import 'package:flutter_atividade/ui/screens/profile_feed.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        leftButton: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ProfilePageFeed()),
            );
          },
          icon: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: Icon(Icons.people), //Image.asset("avatar da pessoa"),
          ),
        ),
        centerText: Text("Feed"),
        rightButton: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreatePostFeed()),
            );
          },
          icon: Icon(Icons.add),
        ),
        bottomButtons: [
          CustomAppbarButton(
            label: "Feed",
            icon: Icons.feed,
            selected: true,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => FeedPage()),
              );
            },
          ),
          CustomAppbarButton(
            label: "Vagas",
            icon: Icons.work,
            selected: false,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => JobsPage()),
              );
            },
          ),
          CustomAppbarButton(
            label: "Alertas",
            icon: Icons.notifications,
            selected: false,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => NotificationsPage()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /*             CustomPost(
              post: Post(
                user: User(name: "João", password: "123", profilePicture: ""),
                time: DateTime(2023),
                title: "Abacate",
                text: "Teste Teste Teste",
                favorites: 200,
              ),
            ), */
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
