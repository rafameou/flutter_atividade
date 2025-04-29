import 'package:flutter/material.dart';
import 'package:flutter_atividade/ui/feed_ui.dart';
import 'package:flutter_atividade/models/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(10), child: Text("Bem-Vindo!")),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Login"),
                  hintText: "Digite seu nome",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Senha"),
                  hintText: "Digite sua senha",
                ),
              ),
            ),
            Column(
              children: [
                Row(
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => FeedPage()),
                        );
                      },
                      icon: Icon(Icons.login),
                      label: Text("Logar"),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.app_registration),
                      label: Text("Cadastrar"),
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.password),
                      label: Text("Esqueci minha senha"),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
