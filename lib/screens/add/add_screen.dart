import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/item_list.dart';
import 'package:todo_app/screens/add/birthday_item.dart';

class AddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      body: Container(
        child: Consumer<ItemList>(
          builder: (context, birthday, _) {
            return ListView.builder(
              itemCount: birthday.friendBirthdayList.length,
              itemBuilder: (context, index) {
                return Container(
                  child: BirthdayItem(
                    firstLetter: "C",
                    name: birthday.friendBirthdayList[index].name,
                    dateOfBirth: birthday.friendBirthdayList[index].dateOfBirth,
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[900],
        foregroundColor: Colors.black,
        onPressed: () {
          // Respond to button press
        },
        child: Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
}
