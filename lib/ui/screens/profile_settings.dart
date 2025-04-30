import 'package:flutter/material.dart';
import 'package:flutter_atividade/ui/widgets/appbar.dart';
import 'package:flutter_atividade/ui/screens/login.dart';
//import 'package:flutter_atividade/models/user.dart';
import 'package:flutter_atividade/ui/screens/profile_feed.dart';

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
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("Até logo!")));
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
                  hintText: "Digite algo para alterar seu nome.",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("E-Mail"),
                  hintText: "Digite algo para alterar seu correio eletrônico.",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Senha"),
                  hintText: "Digite algo para alterar sua senha.",
                ),
                obscureText: true,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Confirme sua senha"),
                  hintText: "Confirme sua senha novamente.",
                ),
                obscureText: true,
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
