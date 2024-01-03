import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class _AccountManager {
  _AccountManager()
      : _firestore = FirebaseFirestore.instance,
        _firebaseAuth = FirebaseAuth.instance,
        _userCredential = null,
        _account = null;

  final FirebaseFirestore _firestore;
  final FirebaseAuth _firebaseAuth;
  UserCredential? _userCredential;
  DocumentReference? _account;

  UserCredential? get userCredential {
    return _userCredential!;
  }

  DocumentReference? get account {
    return _account;
  }

  void initializeFirebase() {
    _account = _firestore.collection("accounts").doc(
          _firebaseAuth.currentUser!.uid,
        );
  }

  Future<bool> createAccount({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      _userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      _account = _firestore.collection("accounts").doc(
            _userCredential!.user!.uid,
          );

      await _account!.set(
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
      _userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      _account = _firestore.collection("accounts").doc(
            _userCredential!.user!.uid,
          );
    } on FirebaseAuthException {
      return false;
    }

    return true;
  }
}

final accountManager = _AccountManager();
