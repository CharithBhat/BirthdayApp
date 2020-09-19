import 'package:cloud_firestore/cloud_firestore.dart';

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
        .doc()
        .set(
      {
        'name': name,
        'date': date,
      },
    );
  }

  // retrieve user data

  void getData() {
    birthdayCollection.doc().collection('friendBirthdays').get().then(
          (QuerySnapshot snapshot) => snapshot.docs.forEach(
            (element) {
              print("${element.data}");
            },
          ),
        );
  }

  Stream<QuerySnapshot> get birthdays {
    return birthdayCollection.snapshots();
  }
}
