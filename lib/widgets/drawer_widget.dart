import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/app_state_notifier.dart';

import '../screens/login_screen.dart';
import '../authentication/authentication.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        createDrawerHeader(context),
        createDrawerBodyItem(
            icon: Icons.exit_to_app,
            text: 'Logout',
            onTap: () {
              signOutGoogle();
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) {
                    return LoginPage();
                  },
                ),
                ModalRoute.withName('/'),
              );
            }),
        //createDrawerBodyItem(icon: Icons.account_circle, text: 'Profile'),
        SwitchListTile(
          title: Text('Dark Mode'),
          value:
              Provider.of<AppStateNotifier>(context, listen: true).isDarkModeOn,
          onChanged: (boolVal) {
            Provider.of<AppStateNotifier>(context, listen: false)
                .updateTheme(boolVal);
          },
        ),
        createDrawerBodyItem(icon: Icons.settings, text: 'Settings'),
        Divider(),
        createDrawerBodyItem(
            icon: Icons.notifications_active, text: 'Notifications'),
        createDrawerBodyItem(icon: Icons.contact_phone, text: 'Contact Info'),
        ListTile(
          title: Text('App version 1.0.0'),
          onTap: () {},
        ),
      ],
    );
  }
}

Widget createDrawerHeader(BuildContext context) {
  return DrawerHeader(
    margin: EdgeInsets.zero,
    padding: EdgeInsets.zero,
    child: Stack(
      children: <Widget>[
        Container(
          color: Theme.of(context).primaryColor,
          child: Center(
            child: Container(
              width: 100,
              height: 100,
              margin: EdgeInsets.only(bottom: 30),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 12.0,
          left: 16.0,
          child: Text(
            "Welcome $name",
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
      ],
    ),
  );
}

Widget createDrawerBodyItem(
    {IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text),
        )
      ],
    ),
    onTap: onTap,
  );
}
