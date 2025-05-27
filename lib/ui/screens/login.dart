import 'package:flutter/material.dart';
import 'package:flutter_atividade/models/user.dart';
import 'package:flutter_atividade/objectbox.g.dart';
import 'package:flutter_atividade/ui/screens/feed_ui.dart';
import 'package:flutter_atividade/ui/screens/forgot_password.dart';
import 'package:flutter_atividade/ui/screens/register.dart';
//import 'package:flutter_atividade/models/user.dart';
import 'package:flutter_atividade/main.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  //final _passController = TextEditingController();
  List<User> users = [];

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
                  controller: _userController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Digite seu login/nome.";
                    }
                    if (users.isEmpty) {
                      return "Esse usuário não está cadastrado.";
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
                  //controller: _passController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Digite sua senha.";
                    }
                    if (users.isEmpty) {
                      return "Cheque sua conexão com a internet.";
                    }
                    if (users[0].password != value) {
                      return "Senha incorreta.";
                    }
                    theUser = users[0];
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
                          final query =
                              userBox
                                  .query(
                                    User_.name.equals(_userController.text),
                                  )
                                  .build();

                          users = query.find();

                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Login realizado com sucesso!"),
                              ),
                            );
                            users = [];
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
