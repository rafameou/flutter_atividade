import 'package:flutter/material.dart';
import 'package:flutter_atividade/main.dart';
//import 'package:flutter_atividade/models/user.dart';
import 'package:flutter_atividade/models/post.dart';

class CreatePostFeed extends StatefulWidget {
  final bool isThisVaga;
  const CreatePostFeed({super.key, required this.isThisVaga});

  @override
  State<CreatePostFeed> createState() => _CreatePostFeedState();
}

class _CreatePostFeedState extends State<CreatePostFeed> {
  final formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _textController = TextEditingController();
  String? title;
  String? text;
  String? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Criar Post")),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Título"),
                    hintText: "Digite um título legal para seu post!",
                  ),
                  controller: _titleController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Digite um título.";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    title = value; // Save the input value
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Corpo"),
                    hintText: "Digite seu post!",
                  ),
                  minLines: 10,
                  maxLines: 20,
                  controller: _textController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Digite um corpo de texto.";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    text = value; // Save the input value
                  },
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextButton.icon(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();

                          Post novoPost = Post(
                            title: _titleController.text,
                            text: _textController.text,
                            time: DateTime.now(),
                            vaga: widget.isThisVaga,
                            comment: false,
                            favorites: 0,
                          );

                          novoPost.user.target = theUser;

                          postBox.put(novoPost);

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Post publicado!")),
                          );
                          Navigator.pop(context);
                        }
                      },
                      label: Text("Publicar"),
                      icon: Icon(Icons.post_add),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextButton.icon(
                      onPressed: () {},
                      label: Text("Inserir Anexo"),
                      icon: Icon(Icons.attachment),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
