import 'package:flutter/material.dart';

import './authentication/login_page.dart';
import 'authentication/sign_in.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        createDrawerHeader(),
        createDrawerBodyItem(icon: Icons.exit_to_app, text: 'Logout',onTap: (){
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
        createDrawerBodyItem(icon: Icons.account_circle, text: 'Profile'),
        createDrawerBodyItem(icon: Icons.event_note, text: 'Events'),
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

Widget createDrawerHeader() {
  return DrawerHeader(
    margin: EdgeInsets.zero,
    padding: EdgeInsets.zero,
    // decoration: BoxDecoration(
    //     image: DecorationImage(
    //         fit: BoxFit.fill, image: AssetImage('images/bg_header.jpeg'))),
    child: Stack(
      children: <Widget>[
        Container(
          color: Colors.blue[900],
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
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w500),
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
