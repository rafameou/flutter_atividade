import 'package:flutter/material.dart';
import 'package:flutter_atividade/models/post.dart';
import 'package:flutter_atividade/ui/widgets/appbar.dart';
import 'package:flutter_atividade/ui/widgets/appbar_button.dart';
import 'package:flutter_atividade/ui/screens/feed_ui.dart';
import 'package:flutter_atividade/ui/widgets/post_ui.dart';
import 'package:flutter_atividade/models/user.dart';
import 'package:flutter_atividade/ui/screens/profile_feed.dart';
import 'package:flutter_atividade/ui/screens/profile_jobs.dart';
import 'package:flutter_atividade/ui/screens/profile_settings.dart';

class ProfilePageComments extends StatefulWidget {
  const ProfilePageComments({super.key});

  @override
  State<ProfilePageComments> createState() => _ProfilePageCommentsState();
}

class _ProfilePageCommentsState extends State<ProfilePageComments> {
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
            selected: false,
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
            selected: true,
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
            /* CustomPost(
              post: Post(
                user: User(name: "Você", password: "123", profilePicture: ""),
                time: DateTime(2023),
                title: "b",
                text: "c",
                favorites: 0,
              ),
            ), */
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
