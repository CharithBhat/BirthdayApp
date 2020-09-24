import 'package:flutter/material.dart';
import 'package:todo_app/widgets/drawer_widget.dart';
import '../widgets/ReminderList_widget.dart';
import '../widgets/date_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          'Upcoming Birthdays',
          style: Theme.of(context).appBarTheme.textTheme.headline1,
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Drawer(
        child: DrawerWidget(),
      ),

      // Separation for Readability

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Date(), // date_widget.dart
          ReminderList(), // Reminder_List.dart
        ],
      ),
    );
  }
}
