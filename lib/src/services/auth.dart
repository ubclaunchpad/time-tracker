import 'package:firebase_auth/firebase_auth.dart' as Firebase;
import 'package:time_tracker/src/models/user.dart';

class AuthService {
  final Firebase.FirebaseAuth _auth = Firebase.FirebaseAuth.instance;

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      Firebase.UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return _getUserFromFirebaseUser(result.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      Firebase.UserCredential result = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return _getUserFromFirebaseUser(result.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Stream<User> get user {
    return _auth.authStateChanges().map(_getUserFromFirebaseUser);
  }

  User _getUserFromFirebaseUser(Firebase.User user) {
    return user != null ? User(id: user.uid) : null;
  }


}
