import 'package:flutter/material.dart';
import 'package:flutter_atividade/models/user.dart';

class CustomPost extends StatefulWidget {
  final User user;
  final DateTime date;
  final String title;
  final String text;
  const CustomPost({
    super.key,
    required this.user,
    required this.date,
    required this.title,
    required this.text,
  });

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
            IconButton(
              onPressed: () {},
              icon: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Icon(
                  Icons.people,
                ), //Image.asset(widget.user.profilePicture),
              ),
            ),
            Text(widget.user.name),
            Spacer(),
            Text(widget.date.toString()),
          ],
        ),
        //Divider(),
        ListTile(
          title: Text(
            widget.title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Container(
            padding: EdgeInsets.only(top: 5.0),
            child: Text(
              widget.text,
              style: TextStyle(color: Colors.white, fontSize: 15.0),
            ),
          ),
        ),
        //Divider(),
        Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.star)),
            IconButton(onPressed: () {}, icon: Icon(Icons.comment)),
            IconButton(onPressed: () {}, icon: Icon(Icons.help)),
          ],
        ),
        Divider(/*color: Color(0xFFFF5DFF)*/),
      ],
    );
  }
}
