import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'class_punch_card.dart';
import 'database_service.dart';

final db = DatabaseService();

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
        StreamBuilder(
          stream: db.upcomingClassesStream(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<DocumentSnapshot> docs = snapshot.data.documents;
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: docs.length,
                  itemBuilder: (context, i) {
                    DocumentSnapshot docSnap = docs[i];
                    return Card(
                      child: ListTile(
                        title: Text(docSnap["title"]),
                        trailing: FutureBuilder(
                          future: db.getAttendees(docSnap.id),
                          builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              DocumentSnapshot<Map> docSnap = snapshot.data;
                              if (docSnap.exists) {
                                return Text("Attendees: " +
                                    docSnap.data()!.length.toString());
                              } else
                                return Text("Attendees: 0");
                            } else
                              return CircularProgressIndicator();
                          },
                        ),
                      ),
                    );
                  });
            } else
              return CircularProgressIndicator();
          },
        ),
      ],
    );
  }
}
