import 'package:flutter/material.dart';
import 'package:todo_app/screens/add_screen.dart';
import 'package:todo_app/screens/place_holder_screen.dart';
import '../screens/home_screen.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    AddScreen(),
    PlaceHolderScreen(),
    PlaceHolderScreen(),
    PlaceHolderScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).iconTheme.color,
        unselectedFontSize: 12,
        selectedFontSize: 12,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_alert),
            title: Text(
              'Birthdays',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              size: 30,
            ),
            title: Text(
              'Add',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_alert),
            title: Text(
              'Upcoming',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_alert),
            title: Text(
              'Upcoming',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_alert),
            title: Text(
              'Upcoming',
            ),
          ),
        ],
      ),
    );
  }
}
