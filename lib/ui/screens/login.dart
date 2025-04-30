import 'package:flutter/material.dart';
import 'package:flutter_atividade/ui/screens/feed_ui.dart';
import 'package:flutter_atividade/ui/screens/forgot_password.dart';
import 'package:flutter_atividade/ui/screens/register.dart';
//import 'package:flutter_atividade/models/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(10), child: Text("Bem-Vindo!")),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Login"),
                    hintText: "Digite seu nome",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Digite seu login/nome.";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Senha"),
                    hintText: "Digite sua senha",
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Digite sua senha.";
                    }
                    return null;
                  },
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Login realizado com sucesso!"),
                              ),
                            );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FeedPage(),
                              ),
                            );
                          }
                        },
                        icon: Icon(Icons.login),
                        label: Text("Logar"),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterPage(),
                            ),
                          );
                        },
                        icon: Icon(Icons.app_registration),
                        label: Text("Cadastrar"),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotPasswordPage(),
                            ),
                          );
                        },
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
      ),
    );
  }
}
