import 'package:flutter/material.dart';
import 'class_punch_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ClassPunchCard(),
          Divider(),
          UpcomingClasses(),
        ],
      ),
    );
  }
}

class UpcomingClasses extends StatefulWidget {
  @override
  _UpcomingClassesState createState() => _UpcomingClassesState();
}

class _UpcomingClassesState extends State<UpcomingClasses> {
  final classes = ["Class 1", "Class 2", "Class 3"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Upcoming Classes: "),
        ),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: classes.length,
            itemBuilder: (context, i) {
              return Card(
                child: ListTile(
                  title: Text(classes[i]),
                ),
              );
            }),
      ],
    );
  }
}
