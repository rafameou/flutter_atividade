import 'package:flutter/material.dart';
import 'package:flutter_atividade/models/post.dart';
import 'package:flutter_atividade/ui/appbar.dart';
import 'package:flutter_atividade/ui/appbar_button.dart';
import 'package:flutter_atividade/ui/feed_ui.dart';
import 'package:flutter_atividade/ui/login.dart';
import 'package:flutter_atividade/ui/notifications_ui.dart';
import 'package:flutter_atividade/ui/post_ui.dart';
import 'package:flutter_atividade/models/user.dart';
import 'package:flutter_atividade/ui/profile_comments.dart';
import 'package:flutter_atividade/ui/profile_feed.dart';
import 'package:flutter_atividade/ui/profile_jobs.dart';

class ProfilePageSettings extends StatefulWidget {
  const ProfilePageSettings({super.key});

  @override
  State<ProfilePageSettings> createState() => _ProfilePageSettingsState();
}

class _ProfilePageSettingsState extends State<ProfilePageSettings> {
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
          icon: Icon(Icons.arrow_back),
        ),
        centerText: Text("Configurações"),
        rightButton: IconButton(
          icon: Icon(Icons.logout),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
        ),
        bottomButtons: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: IconButton(
                icon: Icon(Icons.person),
                onPressed: () {},
                iconSize: 200,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Nome"),
                  hintText: "Digite algo para alterar seu nome",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Senha"),
                  hintText: "Digite algo para alterar sua senha",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Confirme sua senha"),
                  hintText: "Confirme sua senha novamente",
                ),
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
