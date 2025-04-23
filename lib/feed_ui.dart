import 'package:flutter/material.dart';
import 'package:flutter_atividade/appbar.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Stack(
        children: [
          Center(child: Stack(children: [Text("Abacate")])),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
