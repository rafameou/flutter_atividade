import 'package:flutter/material.dart';
//import 'package:flutter_atividade/models/user.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
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
              Padding(
                padding: EdgeInsets.all(10),
                child: Text("Esqueceu sua senha?"),
              ),
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
                    label: Text("E-Mail"),
                    hintText: "Digite seu correio eletrônico.",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Digite seu E-Mail.";
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
                            // #TODO não funciona
                            showDialog(
                              context: context,
                              builder:
                                  (BuildContext context) => AlertDialog(
                                    title: const Text('Atenção'),
                                    content: const Text(
                                      "Verifique seu correio eletrônico para instruções de como trocar sua senha!",
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context); //Pop dialog
                                          Navigator.pop(
                                            context,
                                          ); //Pop esqueceu senha
                                        },
                                        child: const Text('OK'),
                                      ),
                                    ],
                                  ),
                            );
                            //Navigator.pop(context);
                          }
                        },
                        icon: Icon(Icons.send),
                        label: Text("Enviar"),
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
