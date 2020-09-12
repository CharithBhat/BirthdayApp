import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/home.dart/Todo_Model.dart';
import 'package:todo_app/nav_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(),
      home: ChangeNotifierProvider(
        create: (context) => TodoModel(),
        child: NavBar(),
      ),
    );
  }
}
