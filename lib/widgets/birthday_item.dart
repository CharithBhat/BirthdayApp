import 'package:flutter/material.dart';

class BirthdayItem extends StatelessWidget {
  final String firstLetter;
  final String name;
  final String dateOfBirth;

  BirthdayItem({this.firstLetter, this.name, this.dateOfBirth});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue[900],
        child: Text('$firstLetter'),
      ),
      title: Text('$name'),
      subtitle: Text('$dateOfBirth'),
    );
  }
}
