import 'package:flutter/material.dart';

class User {
  int uid;
  String firstName;
  String lastName;
  DateTime birthDate;
  String imagePath;

  User(
      {this.firstName,
      this.lastName,
      this.birthDate,
      this.imagePath,
      this.uid});
}

class UserPage extends StatelessWidget {
  User michael = User(firstName: "Michael", lastName: "Vander Ploeg");

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      michael.firstName,
                      style: TextStyle(
                        fontSize: 52,
                      ),
                    ),
                    Text(
                      michael.lastName,
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
