import 'package:flutter/cupertino.dart';
import '../models/friend_birthday.dart';

class ItemList with ChangeNotifier{
  List<FriendBirthday> friendBirthdayList = [];

  addFriendBirthdayInList (){
    FriendBirthday theirBirthday = FriendBirthday(name: 'charith',dateOfBirth: '04/09/1999');
    friendBirthdayList.add(theirBirthday);
    notifyListeners();
  }

  List<FriendBirthday> get theList{
    return friendBirthdayList;
  }
}