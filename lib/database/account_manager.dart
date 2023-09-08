import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/collection_model.dart';

class _AccountManager {
  _AccountManager()
      : _firestore = FirebaseFirestore.instance,
        _firebaseAuth = FirebaseAuth.instance,
        _createdAccount = null;

  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;
  UserCredential? _createdAccount;

  Future<bool> createAccount({
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      _createdAccount = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await _firestore
          .collection("accounts")
          .doc(_createdAccount!.user!.uid)
          .set(
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
      _createdAccount = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException {
      return false;
    }

    return true;
  }

  Future<void> addCollection({required CollectionModel collection}) async {
    await _firestore
        .collection("accounts")
        .doc(_createdAccount!.user!.uid)
        .collection("collections")
        .doc(collection.id)
        .set(
      {
        "name": collection.name,
        "image": collection.image,
        "icon": collection.icon.codePoint,
      },
    );
  }

  Future<List<CollectionModel>> getCollections() async {
    QuerySnapshot databaseCollections = await _firestore
        .collection("accounts")
        .doc(_createdAccount!.user!.uid)
        .collection("collections")
        .get();

    List<CollectionModel> collections = [];

    for (var i = 0; i < databaseCollections.docs.length; i++) {
      final collection = databaseCollections.docs[i];

      collections = [
        ...collections,
        CollectionModel(
          name: collection.get("name"),
          icon: IconData(collection.get("icon"), fontFamily: 'MaterialIcons'),
          image: collection.get("image"),
          progress: [],
          completed: [],
        ),
      ];
    }

    return collections;
  }
}

final accountManager = _AccountManager();
