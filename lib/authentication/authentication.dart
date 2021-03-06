import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:todo_app/database/database.dart';
import 'package:todo_app/models/user_man.dart' as model;

final FirebaseAuth _auth = FirebaseAuth.instance;

// creates a user object based on firebaseUser

model.User _userFromFirebase(User user) {
  return user != null ? model.User(uid: user.uid) : null;
}

Stream<model.User> get user {
  return _auth.authStateChanges().map((User user) => _userFromFirebase(user));
}

final GoogleSignIn googleSignIn = GoogleSignIn();

String name;
String email;
String imageUrl;
String userId;

Future<String> signInWithGoogle() async {
  await Firebase.initializeApp();

  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult =
      await _auth.signInWithCredential(credential);
  final User user = authResult.user;

  if (user != null) {
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final User currentUser = _auth.currentUser;
    assert(user.uid == currentUser.uid);

    assert(user.email != null);
    assert(user.displayName != null);
    assert(user.photoURL != null);

    name = user.displayName;
    email = user.email;
    imageUrl = user.photoURL;
    userId = user.uid;

    if (name.contains(" ")) {
      name = name.substring(0, name.indexOf(" "));
    }

    print('signInWithGoogle succeeded: $user');

    //create a new document for the uid
    await DatabaseService(uid: user.uid).updateUserData(name, " ", imageUrl);

    return '$user';
  }

  return null;
}

void signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Signed Out");
}
