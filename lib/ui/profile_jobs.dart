import 'package:flutter/material.dart';
import 'package:flutter_atividade/models/post.dart';
import 'package:flutter_atividade/ui/appbar.dart';
import 'package:flutter_atividade/ui/appbar_button.dart';
import 'package:flutter_atividade/ui/feed_ui.dart';
import 'package:flutter_atividade/ui/notifications_ui.dart';
import 'package:flutter_atividade/ui/post_ui.dart';
import 'package:flutter_atividade/models/user.dart';
import 'package:flutter_atividade/ui/profile_comments.dart';
import 'package:flutter_atividade/ui/profile_feed.dart';
import 'package:flutter_atividade/ui/profile_settings.dart';

class ProfilePageJobs extends StatefulWidget {
  const ProfilePageJobs({super.key});

  @override
  State<ProfilePageJobs> createState() => _ProfilePageJobsState();
}

class _ProfilePageJobsState extends State<ProfilePageJobs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        leftButton: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => FeedPage()),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
        centerText: Text("Usuário"),
        rightButton: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => ProfilePageSettings()),
            );
          },
          icon: Icon(Icons.settings),
        ),
        bottomButtons: [
          CustomAppbarButton(
            label: "Seus Posts",
            icon: Icons.post_add,
            selected: false,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfilePageFeed()),
              );
            },
          ),
          CustomAppbarButton(
            label: "Vagas Postadas",
            icon: Icons.work,
            selected: true,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfilePageJobs()),
              );
            },
          ),
          CustomAppbarButton(
            label: "Comentários",
            icon: Icons.comment,
            selected: false,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfilePageComments()),
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
                user: User(name: "Você", password: "123", profilePicture: ""),
                time: DateTime(2023),
                title: "a",
                text: "c",
                favorites: 123,
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
