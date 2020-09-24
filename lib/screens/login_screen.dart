import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/birthday_list_model.dart';
import 'package:todo_app/widgets/nav_bar.dart';
import 'package:todo_app/providers/item_list.dart';

import '../authentication/authentication.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(size: 150),
              SizedBox(height: 50),
              _signInButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signInButton() {
    return OutlineButton(
      splashColor: Theme.of(context).splashColor,
      onPressed: () {
        signInWithGoogle().then((result) {
          if (result != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return MultiProvider(
                    providers: [
                      ChangeNotifierProvider<BirthdayList>(
                        create: (context) => BirthdayList(),
                      ),
                      ChangeNotifierProvider<ItemList>(
                        create: (context) => ItemList(),
                      ),
                    ],
                    child: NavBar(),
                  );
                },
              ),
            );
          }
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Theme.of(context).accentColor),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: Theme.of(context).textTheme.headline2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
