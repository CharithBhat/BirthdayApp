import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/authentication/authentication.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference birthdayCollection =
      FirebaseFirestore.instance.collection('birthdays');

  // create/ update user data

  Future updateUserData(String name, String date, String image) async {
    return await birthdayCollection
        .doc(uid)
        .collection("userDetails")
        .doc('details')
        .set(
      {
        'name': name,
        'date': date,
        'image': image,
      },
    );
  }

  // creat/ update birthday data

  Future updateUserBirthdays(String name, String date) async {
    print('hello');
    return await birthdayCollection
        .doc(uid)
        .collection("friendBirthdays")
        .doc('hello') // needs to be set dynamically
        .set(
      {
        'name': name,
        'date': date,
      },
    );
  }

  Future updateStuff() async {
    return await birthdayCollection
        .doc(userId)
        .collection('friendBirthdays')
        .doc('hello')
        .update(
          {'name': 'notCharith'},
        )
        .then(
          (value) => print('updated the name'),
        )
        .catchError(
          (error) => print('error occurred'),
        );
  }

  Future<void> deleteBirthday() async {
    return await birthdayCollection
        .doc(userId)
        .collection('friendBirthdays')
        .doc('hello') // needs to be set dynamically
        .delete()
        .then((value) => print('user deleted'))
        .catchError(
      (onError) {
        print("Failed to delete birthday");
      },
    );
  }
}
