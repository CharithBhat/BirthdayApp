import 'package:flutter/material.dart';
import 'package:todo_app/home.dart/home_screen.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue[900],
        unselectedItemColor: Colors.grey[600],
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_alert),
            title: Text('Upcoming'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_alert),
            title: Text('Upcoming'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_alert),
            title: Text('Upcoming'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_alert),
            title: Text('Upcoming'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_alert),
            title: Text('Upcoming'),
          ),
        ],
      ),
    );
  }
}
