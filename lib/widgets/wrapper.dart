import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/user_man.dart';
import 'package:todo_app/screens/login_page.dart';
import 'package:todo_app/widgets/nav_bar.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    // Either return home screen or authentication screen
    if (user == null) {
      return LoginPage();
    } else {
      return NavBar();
    }
  }
}
