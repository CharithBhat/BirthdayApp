import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/drawer_widget.dart';
import 'ReminderList_widget.dart';
import 'date_widget.dart';
import 'package:todo_app/models/birthday_list_model.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        title: Text('Upcoming Birthdays'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Provider.of<BirthdayList>(context, listen: false).addBirthdayInList();
            },
          ),
        ],
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
