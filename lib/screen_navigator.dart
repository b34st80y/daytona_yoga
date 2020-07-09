import 'package:flutter/material.dart';
import 'home_page.dart';

class ScreenNavigator extends StatefulWidget {
  @override
  _ScreenNavigatorState createState() => _ScreenNavigatorState();
}

class _ScreenNavigatorState extends State<ScreenNavigator> {
  final _screens = [HomePage()];
  int _displayedScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            title: Text("Account"),
          )
        ],
      ),
      appBar: AppBar(
        title: Text("Daytona Yoga with Krista"),
      ),
      body: _screens[_displayedScreen],
    );
  }
}
