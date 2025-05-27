import 'package:flutter/material.dart';
import 'package:flutter_atividade/models/post.dart';

class CustomPost extends StatefulWidget {
  final Post post;
  const CustomPost({super.key, required this.post});

  @override
  State<CustomPost> createState() => _CustomPostState();
}

class _CustomPostState extends State<CustomPost> {
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
            widget.post.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Container(
            padding: EdgeInsets.only(top: 5.0),
            child: Text(
              widget.post.text,
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
            //Text('${widget.post.comments?.length ?? 0} Comentários'),
            //IconButton(onPressed: () {}, icon: Icon(Icons.help)),
          ],
        ),
        Divider(/*color: Color(0xFFFF5DFF)*/),
      ],
    );
  }
}
