import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/collection_model.dart';
import '../models/task_model.dart';

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
    final databaseCollections = await _firestore
        .collection("accounts")
        .doc(_createdAccount!.user!.uid)
        .collection("collections")
        .get();

    if (databaseCollections.docs.isEmpty) return [];

    List<CollectionModel> collections = [];

    for (var i = 0; i < databaseCollections.docs.length; i++) {
      final databaseCollection = databaseCollections.docs[i];

      collections.add(
        CollectionModel(
          id: databaseCollection.id,
          name: databaseCollection.get("name"),
          icon: IconData(
            databaseCollection.get("icon"),
            fontFamily: "MaterialIcons",
          ),
          image: databaseCollection.get("image"),
        ),
      );
    }

    return collections;
  }

  Future<void> addProgressTask({
    required String collectionID,
    required TaskModel task,
  }) async {
    await _firestore
        .collection("accounts")
        .doc(_createdAccount!.user!.uid)
        .collection("collections")
        .doc(collectionID)
        .collection("progress")
        .doc(task.id)
        .set(
      {
        "title": task.title,
        "description": task.description,
        "image": task.image,
        "date": task.date,
      },
    );
  }

  Future<List<TaskModel>> getProgressTasks({
    required String id,
  }) async {
    final databaseTasks = await _firestore
        .collection("accounts")
        .doc(_createdAccount!.user!.uid)
        .collection("collections")
        .doc(id)
        .collection("progress")
        .get();

    if (databaseTasks.docs.isEmpty) return [];

    List<TaskModel> progressTasks = [];

    for (var i = 0; i < databaseTasks.docs.length; i++) {
      final databaseTask = databaseTasks.docs[i];

      progressTasks = [
        ...progressTasks,
        TaskModel(
          id: databaseTask.id,
          title: databaseTask.get("title"),
          description: databaseTask.get("description"),
          image: databaseTask.get("image"),
          date: databaseTask.get("date"),
        ),
      ];
    }

    return progressTasks;
  }
}

final accountManager = _AccountManager();
