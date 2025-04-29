import 'package:flutter/material.dart';
import 'package:flutter_atividade/models/post.dart';
import 'package:flutter_atividade/ui/appbar.dart';
import 'package:flutter_atividade/ui/appbar_button.dart';
import 'package:flutter_atividade/ui/post_ui.dart';
import 'package:flutter_atividade/ui/feed_ui.dart';
import 'package:flutter_atividade/ui/jobs_ui.dart';
import 'package:flutter_atividade/models/user.dart';
import 'package:flutter_atividade/ui/profile_feed.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
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
        centerText: Text("Alertas"),
        rightButton: IconButton(
          onPressed: () {},
          icon: Icon(Icons.notifications_off),
        ),
        bottomButtons: [
          CustomAppbarButton(
            label: "Feed",
            icon: Icons.feed,
            selected: false,
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
            selected: true,
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
            CustomPost(
              post: Post(
                user: User(name: "App", password: "123", profilePicture: ""),
                time: DateTime(2023),
                title: "Parabéns",
                text: "10 likes",
                favorites: 200,
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
