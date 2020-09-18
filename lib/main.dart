import 'package:flutter/material.dart';
import 'package:todo_app/authentication/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue[900],
        accentColor: Colors.white,
      ),
      home: LoginPage(),
      // home: ChangeNotifierProvider(
      //   create: (context) => TodoModel(),
      //   child: LoginPage(),
      // ),
    );
  }
}
