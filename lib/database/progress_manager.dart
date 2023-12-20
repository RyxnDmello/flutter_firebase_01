import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import './account_manager.dart';

import '../models/task_model.dart';

final _date = DateFormat.yMMMMd('en_US').format(DateTime.now());
const _uuid = Uuid();

class _ProgressManager {
  _ProgressManager() : _account = null;

  DocumentReference? _account;

  Future<void> addTask({
    required String collectionID,
    required String description,
    required int background,
    required int priority,
    required String title,
  }) async {
    _account = accountManager.account;

    await _account!
        .collection("collections")
        .doc(collectionID)
        .collection("progress")
        .doc(_uuid.v4())
        .set(
      {
        "title": title,
        "description": description,
        "priority": priority,
        "background": background,
        "date": _date,
      },
    );
  }

  Future<void> deleteTask({
    required String collectionID,
    required String taskID,
  }) async {
    _account = accountManager.account;

    await _account!
        .collection("collections")
        .doc(collectionID)
        .collection("progress")
        .doc(taskID)
        .delete();
  }

  Future<void> clearTasks({
    required String collectionID,
  }) async {
    _account = accountManager.account;

    final dbProgress = await _account!
        .collection("collections")
        .doc(collectionID)
        .collection("progress")
        .get();

    dbProgress.docs.map((progress) async {
      await progress.reference.delete();
    });
  }

  Future<List<TaskModel>> tasks({
    required String collectionID,
  }) async {
    _account = accountManager.account;

    final dbTasks = await _account!
        .collection("collections")
        .doc(collectionID)
        .collection("progress")
        .get();

    if (dbTasks.docs.isEmpty) return [];

    return dbTasks.docs.map((task) {
      return TaskModel(
        id: task.id,
        title: task.data()["title"],
        description: task.data()["description"],
        priority: task.data()["priority"],
        background: task.data()["background"],
        date: task.data()["date"],
      );
    }).toList();
  }
}

final progressManager = _ProgressManager();