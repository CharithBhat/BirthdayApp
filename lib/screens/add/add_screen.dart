import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/item_list.dart';
import 'package:todo_app/screens/add/birthday_item.dart';
import 'package:todo_app/database/database.dart';
import 'package:todo_app/authentication/sign_in.dart';

class AddScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    void confirm() {
      final list =
          Provider.of<ItemList>(context, listen: false).friendBirthdayList;
      list.forEach(
        (element) {
          DatabaseService(uid: userId)
              .updateUserBirthdays('charith', '04/09/1999');
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Add Birthdays'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Provider.of<ItemList>(context, listen: false)
                  .addFriendBirthdayInList();
            },
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            child: Consumer<ItemList>(
              builder: (context, birthday, _) {
                return ListView.builder(
                  itemCount: birthday.friendBirthdayList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: BirthdayItem(
                        firstLetter: "C",
                        name: birthday.friendBirthdayList[index].name,
                        dateOfBirth:
                            birthday.friendBirthdayList[index].dateOfBirth,
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(30),
            child: RaisedButton(
              disabledColor: Colors.blue[900],
              disabledTextColor: Colors.white,
              onPressed: confirm,
              child: Text('Confirm'),
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.blue[900],
      //   foregroundColor: Colors.black,
      //   onPressed: () {
      //     // Respond to button press
      //   },
      //   child: Icon(
      //     Icons.add,
      //     color: Colors.white,
      //   ),
      // ),
    );
  }
}
