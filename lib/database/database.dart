import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference birthdayCollection =
      FirebaseFirestore.instance.collection('birthdays');

  Future updateUserData(String name, String date, String image) async {
    return await birthdayCollection.doc(uid).set(
      {
        'name': name,
        'date': date,
        'image': image,
      },
    );
  }

  Stream<QuerySnapshot> get birthdays{
    return birthdayCollection.snapshots();
  }

}
