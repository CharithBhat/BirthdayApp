import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/authentication/authentication.dart';

class ReminderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50),
          ),
        ),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('birthdays')
              .doc(userId)
              .collection('friendBirthdays')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return CircularProgressIndicator();
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot b = snapshot.data.docs[index];
                return Container(
                  child: ListTile(
                    title: Text(
                      b.data()['name'],
                      style: Theme.of(context).textTheme.subtitle1,
                    ), //
                    subtitle: Text(
                      b.data()['date'],
                      style: Theme.of(context).textTheme.bodyText1,
                    ), // help
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
