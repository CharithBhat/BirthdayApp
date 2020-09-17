import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/birthday_list_model.dart';

class ReminderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: Consumer<BirthdayList>(
          builder: (context, birthday, _) {
            return ListView.builder(
              itemCount: birthday.birthdayList.length,
              itemBuilder: (context, index) {
                return Container(
                  child: ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(bottom: 0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                              birthday.birthdayList[index].imageUrl),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    contentPadding:
                        EdgeInsets.only(top: 8, bottom: 8, left: 32, right: 32),
                    title: Text(
                      birthday.birthdayList[index].name,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Row(
                      children: [
                        Text(
                          birthday.birthdayList[index].date,
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          birthday.birthdayList[index].day,
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  margin: EdgeInsets.only(bottom: 8, left: 16, right: 16),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
