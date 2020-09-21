import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/authentication/sign_in.dart';

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
        // child: StreamBuilder(
        //   stream: FirebaseFirestore.instance
        //       .collection('birthdays')
        //       .doc(userId)
        //       .collection('friendBirthdays')
        //       .snapshots(),
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData) {
        //       print(snapshot.data.docs);
        //       return ListView.builder(
        //         itemCount: snapshot.data.docs.length,
        //         itemBuilder: (context, index) {
        //           return Container(
        //             child: ListTile(
        //               title: Text(snapshot.data.docs[index]['name']), //// help
        //             ),
        //           );
        //         },
        //       );
        //     } else if (snapshot.hasError) {
        //       return CircularProgressIndicator();
        //     } else {
        //       return CircularProgressIndicator();
        //     }
        //   },
        // ),
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
                    title: Text(b.data()['name']), //
                    subtitle: Text(b.data()['date']), // help
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
