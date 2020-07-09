import 'package:flutter/material.dart';
import 'screen_navigator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daytona Yoga with Krista',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: ScreenNavigator(),
    );
  }
}
