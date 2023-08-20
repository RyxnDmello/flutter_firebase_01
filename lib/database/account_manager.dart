import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AccountManager {
  AccountManager()
      : _firestore = FirebaseFirestore.instance,
        _firebaseAuth = FirebaseAuth.instance;

  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  Future<bool> createAccount({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final createdAccount = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firestore.collection("accounts").doc(createdAccount.user!.uid).set(
        {
          "email": email,
          "username": username,
        },
      );
    } on FirebaseAuthException {
      return false;
    }

    return true;
  }

  Future<bool> loginAccount({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException {
      return false;
    }

    return true;
  }
}
