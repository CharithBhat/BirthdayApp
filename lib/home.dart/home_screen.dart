import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/home.dart/ReminderList_widget.dart';
import 'package:todo_app/home.dart/Todo_Model.dart';
import 'package:todo_app/home.dart/date_widget.dart';



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
        leading: Icon(
          Icons.menu,
          color: Colors.white,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Provider.of<TodoModel>(context, listen: false).addTaskInList();
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),

      // Separation for Readability

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Date(), // date.dart
          ReminderList(), // Reminder_List.dart
        ],
      ),

      // Separation for Readabilty

      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.blue[900],
      //   child: Icon(Icons.add),
      //   onPressed: () {
      //     Provider.of<TodoModel>(context, listen: false).addTaskInList();
      //   },
      // ),
    );
  }
}
