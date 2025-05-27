import 'package:flutter/material.dart';
import 'package:flutter_atividade/main.dart';
import 'package:flutter_atividade/models/post.dart';
import 'package:flutter_atividade/ui/widgets/appbar.dart';
import 'package:flutter_atividade/ui/widgets/appbar_button.dart';
import 'package:flutter_atividade/ui/screens/feed_ui.dart';
import 'package:flutter_atividade/ui/widgets/post_ui.dart';
import 'package:flutter_atividade/models/user.dart';
import 'package:flutter_atividade/ui/screens/profile_comments.dart';
import 'package:flutter_atividade/ui/screens/profile_feed.dart';
import 'package:flutter_atividade/ui/screens/profile_settings.dart';

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
        centerText: Text(theUser.name),
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
          children:
              postBox
                  .getAll()
                  .where(
                    (post) =>
                        !post.comment &&
                        post.vaga &&
                        post.user.target?.name == theUser.name,
                  )
                  .map((post) => CustomPost(post: post))
                  .toList(),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
