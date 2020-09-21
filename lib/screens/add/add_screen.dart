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

    void displayBottomSheet(BuildContext context) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Center(
              child: Text('Welcome'),
            ),
          );
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
              displayBottomSheet(context);
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              DatabaseService(uid: userId).deleteBirthday();
            },
          ),
          IconButton(
            icon: Icon(Icons.update),
            onPressed: () {
              DatabaseService(uid: userId).updateStuff();
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
    );
  }
}
