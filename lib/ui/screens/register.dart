import 'package:flutter/material.dart';
//import 'package:flutter_atividade/models/user.dart';
import 'package:flutter_atividade/main.dart';
import 'package:flutter_atividade/models/user.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _passController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text("Crie sua conta!"),
              ),
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
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("E-Mail"),
                    hintText: "Digite seu correio eletrônico.",
                  ),
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Digite seu E-Mail.";
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
                  controller: _passController,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Digite sua senha.";
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
                    label: Text("Confirme sua senha."),
                    hintText: "Confirme sua senha.",
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Verifique sua senha novamente.";
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

                            final user = User(
                              name: _userController.text,
                              password: _passController.text,
                              profilePicture: "",
                            );

                            userBox.put(user);

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Conta criada com sucesso!"),
                              ),
                            );
                            Navigator.pop(context);
                          }
                        },
                        icon: Icon(Icons.add),
                        label: Text("Criar Conta"),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back),
                        label: Text("Voltar"),
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
