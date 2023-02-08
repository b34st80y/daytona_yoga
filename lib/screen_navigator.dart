import 'package:flutter/material.dart';
import 'home_page.dart';
import 'user_page.dart';

class ScreenNavigator extends StatefulWidget {
  @override
  _ScreenNavigatorState createState() => _ScreenNavigatorState();
}

class _ScreenNavigatorState extends State<ScreenNavigator> {
  final _screens = [HomePage(), UserPage()];
  int _displayedScreen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _displayedScreen,
        onTap: (int index) {
          setState(() {
            _displayedScreen = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            label: "Account",
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
