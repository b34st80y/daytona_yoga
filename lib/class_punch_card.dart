import 'package:flutter/material.dart';

class ClassPunchCard extends StatefulWidget {
  @override
  _ClassPunchCardState createState() => _ClassPunchCardState();
}

class _ClassPunchCardState extends State<ClassPunchCard> {
  String classes = "0";
  String name = "Adam";

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      color: Colors.lightBlueAccent,
      child: Container(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Hello, " + name + "!"),
            Text("You have " + classes + " classes left!"),
          ],
        ),
      ),
    );
  }
}
