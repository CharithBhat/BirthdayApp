import 'package:flutter/cupertino.dart';
import 'package:todo_app/home.dart/Task_Model.dart';

class TodoModel extends ChangeNotifier{
  List<TaskModel> taskList = []; // List of all tasks

  addTaskInList(){
    TaskModel taskModel = TaskModel(title: "title: ${taskList.length}", details: "Why do you need Details");
    taskList.add(taskModel);
    notifyListeners();
    // Code to add the task
  }
} 
