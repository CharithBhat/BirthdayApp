import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/home.dart/Todo_Model.dart';

class ReminderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Consumer<TodoModel>(
          builder: (context, todo, child) {
            return ListView.builder(
              itemCount: todo.taskList.length,
              itemBuilder: (context, index) {
                return Container(
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.only(top: 8, bottom: 8, left: 32, right: 32),
                    title: Text(
                      todo.taskList[index].title,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      todo.taskList[index].details,
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Icon(
                      Icons.check_circle,
                      color: Colors.greenAccent,
                    ),
                  ),
                  margin: EdgeInsets.only(bottom: 8, left: 16, right: 16),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
