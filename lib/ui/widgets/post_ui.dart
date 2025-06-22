import 'package:flutter/material.dart';
import 'package:flutter_atividade/env/env.dart';
import 'package:flutter_atividade/models/post.dart';
import 'package:deepl_dart/deepl_dart.dart';

class CustomPost extends StatefulWidget {
  final Post post;
  const CustomPost({super.key, required this.post});

  @override
  State<CustomPost> createState() => _CustomPostState();
}

class _CustomPostState extends State<CustomPost> {
  String postTitle = "";
  String postText = "";

  @override
  void initState() {
    super.initState();
    postTitle = widget.post.title;
    postText = widget.post.text;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Padding(padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2)),
        Row(
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Icon(
                  Icons.cookie,
                ), //Image.asset(widget.post.user.profilePicture),
              ),
              label: Text(widget.post.user.target?.name ?? "N/A"),
            ),
            //Text(widget.post.user.name),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(widget.post.time.toString()),
            ),
          ],
        ),
        //Divider(),
        ListTile(
          title: Text(
            postTitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Container(
            padding: EdgeInsets.only(top: 5.0),
            child: Text(
              postText,
              style: TextStyle(color: Colors.white, fontSize: 15.0),
            ),
          ),
        ),
        //Divider(),
        Row(
          children: [
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.star),
              label: Text('${widget.post.favorites} Favoritos'),
            ),
            //Text('${widget.post.favorites} Favoritos'),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.comment),
              label: Text('${widget.post.comments?.length ?? 0} Comentários'),
            ),
            IconButton(
              onPressed: () async {
                DeepL deepl = DeepL(authKey: Env.deeplApi);
                TextResult post = await deepl.translate.translateText(
                  widget.post.text,
                  'pt-BR',
                );
                TextResult title = await deepl.translate.translateText(
                  widget.post.title,
                  'pt-BR',
                );
                setState(() {
                  postTitle = title.text;
                  postText = post.text;
                });
              },
              icon: Icon(Icons.translate),
            ),
            //Text('${widget.post.comments?.length ?? 0} Comentários'),
            //IconButton(onPressed: () {}, icon: Icon(Icons.help)),
          ],
        ),
        Divider(/*color: Color(0xFFFF5DFF)*/),
      ],
    );
  }
}
