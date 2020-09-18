import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference birthdayCollection =
      FirebaseFirestore.instance.collection('birthdays');

  Future updateUserData(String name, String date, String image) async {
    return await birthdayCollection.doc(uid).collection("userDetails").doc('details').set(
      {
        'name': name,
        'date': date,
        'image': image,
      },
    );
  }

  Future updateUserBirthdays(String name, String date) async {
    print('hello');
    return await birthdayCollection.doc(uid).collection("friendBirthdays").doc('details').set(
      {
        'name': name,
        'date': date,
      },
    );
  }

  Stream<QuerySnapshot> get birthdays {
    return birthdayCollection.snapshots();
  }
}


