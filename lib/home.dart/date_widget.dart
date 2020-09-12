import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Date extends StatefulWidget {

  @override
  _DateState createState() => _DateState();
}

class _DateState extends State<Date> {

  static var dt = DateTime.now();
  static var newFormat = DateFormat("MMM d");
  String updatedDt = newFormat.format(dt);

  static var dateFormat = DateFormat('EEE');
  String updatedDate = dateFormat.format(dt);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 15),
        Text(
          updatedDt,
          softWrap: true,
          style: TextStyle(
            fontSize: 50,
            color: Colors.white,
          ),
        ),  
        Text(
          updatedDate,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
