import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthBase {
  User? get currentUser;
  Stream authStateChanges();
  Future signInAnonymously();
  Future signOut();
}

class Auth implements AuthBase {
  @override
  Stream authStateChanges() => FirebaseAuth.instance.authStateChanges();

  @override
  User? get currentUser => FirebaseAuth.instance.currentUser;

  @override
  Future signInAnonymously() async {
    final userCredential = await FirebaseAuth.instance.signInAnonymously();
    return userCredential.user;
  }

  @override
  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
