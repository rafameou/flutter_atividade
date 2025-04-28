import 'package:flutter/material.dart';
import 'package:flutter_atividade/ui/appbar.dart';
import 'package:flutter_atividade/ui/appbar_button.dart';
import 'package:flutter_atividade/ui/post_ui.dart';
import 'package:flutter_atividade/models/user.dart';

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
          onPressed: () {},
          icon: ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: Icon(Icons.people), //Image.asset("avatar da pessoa"),
          ),
        ),
        centerText: Text("Nome do App"),
        rightButton: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
        bottomButtons: [
          CustomAppbarButton(
            label: "Feed",
            icon: Icons.feed,
            selected: false,
            onPressed: () {},
          ),
          CustomAppbarButton(
            label: "Vagas",
            icon: Icons.work,
            selected: false,
            onPressed: () {},
          ),
          CustomAppbarButton(
            label: "Alertas",
            icon: Icons.notifications,
            selected: false,
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomPost(
              user: User(name: "João", password: "123", profilePicture: ""),
              date: DateTime(2023),
              title: "Abacate",
              text: "Teste Teste Teste",
            ),
            CustomPost(
              user: User(name: "Maria", password: "123", profilePicture: ""),
              date: DateTime(2023),
              title: "Melancia",
              text:
                  "Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste Teste",
            ),
            CustomPost(
              user: User(name: "Carlos", password: "123", profilePicture: ""),
              date: DateTime(2023),
              title: "Abacate",
              text: "Teste Teste Teste",
            ),
            CustomPost(
              user: User(name: "Cleber", password: "123", profilePicture: ""),
              date: DateTime(2023),
              title: "Abacate",
              text: "Teste Teste Teste",
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
