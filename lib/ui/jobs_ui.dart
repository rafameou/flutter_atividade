import 'package:flutter/material.dart';
import 'package:flutter_atividade/models/post.dart';
import 'package:flutter_atividade/ui/appbar.dart';
import 'package:flutter_atividade/ui/appbar_button.dart';
import 'package:flutter_atividade/ui/notifications_ui.dart';
import 'package:flutter_atividade/ui/post_ui.dart';
import 'package:flutter_atividade/ui/feed_ui.dart';
import 'package:flutter_atividade/models/user.dart';
import 'package:flutter_atividade/ui/profile_feed.dart';

class JobsPage extends StatefulWidget {
  const JobsPage({super.key});

  @override
  State<JobsPage> createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
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
        centerText: Text("Vagas"),
        rightButton: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
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
            selected: true,
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
            CustomPost(
              post: Post(
                user: User(name: "João", password: "123", profilePicture: ""),
                time: DateTime(2023),
                title: "uau emprego",
                text: "requisitos: estar vivo\nClique aqui para emprego",
                favorites: 100,
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
