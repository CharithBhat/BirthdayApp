import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/authentication/authentication.dart';
import 'package:todo_app/models/birthday_model.dart';

class BirthdayList with ChangeNotifier{
  List<Birthday> birthdayList = [];

  static var dt = DateTime.now();
  static var newFormat = DateFormat("MMM d");
  String updatedDt = newFormat.format(dt);
  static var dayFormat = DateFormat("EEE");
  String updateDay = dayFormat.format(dt);

  addBirthdayInList(){
    Birthday birthday = Birthday(imageUrl: imageUrl, date: updatedDt,day: updateDay,name: name);
    birthdayList.add(birthday);
    notifyListeners();
  }
}