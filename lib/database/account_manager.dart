import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

import '../models/collection_model.dart';
import '../models/task_model.dart';

final _date = DateFormat.yMMMMd('en_US').format(DateTime.now());
const _uuid = Uuid();

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

  Future<void> addCollection({
    required String name,
    required String image,
    required IconData icon,
  }) async {
    await _firestore
        .collection("accounts")
        .doc(_createdAccount!.user!.uid)
        .collection("collections")
        .doc(_uuid.v4())
        .set(
      {
        "name": name,
        "date": _date,
        "image": image,
        "icon": icon.codePoint,
      },
    );
  }

  Future<void> deleteCollection({required String collectionID}) async {
    await _firestore
        .collection("accounts")
        .doc(_createdAccount!.user!.uid)
        .collection("collections")
        .doc(collectionID)
        .delete();
  }

  Future<List<CollectionModel>> getCollections() async {
    final databaseCollections = await _firestore
        .collection("accounts")
        .doc(_createdAccount!.user!.uid)
        .collection("collections")
        .get();

    if (databaseCollections.docs.isEmpty) return [];

    final List<CollectionModel> collections = [];

    for (var i = 0; i < databaseCollections.docs.length; i++) {
      final databaseCollection = databaseCollections.docs[i];

      collections.add(
        CollectionModel(
          id: databaseCollection.id,
          name: databaseCollection.get("name"),
          date: databaseCollection.get("date"),
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
    required String description,
    required int background,
    required int priority,
    required String title,
  }) async {
    await _firestore
        .collection("accounts")
        .doc(_createdAccount!.user!.uid)
        .collection("collections")
        .doc(collectionID)
        .collection("progress")
        .doc(_uuid.v4())
        .set(
      {
        "title": title,
        "description": description,
        "background": background,
        "priority": priority,
        "date": _date,
      },
    );
  }

  Future<void> deleteProgressTask({
    required String collectionID,
    required String taskID,
  }) async {
    await _firestore
        .collection("accounts")
        .doc(_createdAccount!.user!.uid)
        .collection("collections")
        .doc(collectionID)
        .collection("progress")
        .doc(taskID)
        .delete();
  }

  Future<void> clearProgressTasks({
    required String collectionID,
  }) async {
    final docs = await _firestore
        .collection("accounts")
        .doc(_createdAccount!.user!.uid)
        .collection("collections")
        .doc(collectionID)
        .collection("progress")
        .get();

    for (var element in docs.docs) {
      await element.reference.delete();
    }
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

    final List<TaskModel> progressTasks = [];

    for (var i = 0; i < databaseTasks.docs.length; i++) {
      final databaseTask = databaseTasks.docs[i];

      progressTasks.add(
        TaskModel(
          id: databaseTask.id,
          title: databaseTask.data()["title"],
          description: databaseTask.data()["description"],
          background: databaseTask.data()["background"],
          priority: databaseTask.data()["priority"],
          date: databaseTask.data()["date"],
        ),
      );
    }

    return progressTasks;
  }

  Future<void> addCompletedTask({
    required String collectionID,
    required String description,
    required int background,
    required int priority,
    required String title,
  }) async {
    await _firestore
        .collection("accounts")
        .doc(_createdAccount!.user!.uid)
        .collection("collections")
        .doc(collectionID)
        .collection("completed")
        .doc(_uuid.v4())
        .set(
      {
        "title": title,
        "description": description,
        "background": background,
        "priority": priority,
        "date": _date,
      },
    );
  }

  Future<void> deleteCompletedTask({
    required String collectionID,
    required String taskID,
  }) async {
    await _firestore
        .collection("accounts")
        .doc(_createdAccount!.user!.uid)
        .collection("collections")
        .doc(collectionID)
        .collection("completed")
        .doc(taskID)
        .delete();
  }

  Future<List<TaskModel>> getCompletedTasks({
    required String id,
  }) async {
    final databaseTasks = await _firestore
        .collection("accounts")
        .doc(_createdAccount!.user!.uid)
        .collection("collections")
        .doc(id)
        .collection("completed")
        .get();

    if (databaseTasks.docs.isEmpty) return [];

    final List<TaskModel> completedTasks = [];

    for (var i = 0; i < databaseTasks.docs.length; i++) {
      final databaseTask = databaseTasks.docs[i];

      completedTasks.add(
        TaskModel(
          id: databaseTask.id,
          title: databaseTask.data()["title"],
          description: databaseTask.data()["description"],
          background: databaseTask.data()["background"],
          priority: databaseTask.data()["priority"],
          date: databaseTask.data()["date"],
        ),
      );
    }

    return completedTasks;
  }
}

final accountManager = _AccountManager();
