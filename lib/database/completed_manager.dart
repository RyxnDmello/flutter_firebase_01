import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

import './account_manager.dart';

import '../models/task_model.dart';

const _uuid = Uuid();

class _CompletedManager {
  _CompletedManager() : _account = null;

  DocumentReference? _account;

  Future<void> addTask({
    required String collectionID,
    required String title,
    required String description,
    required int priority,
    required String date,
  }) async {
    _account = accountManager.account;

    await _account!
        .collection("collections")
        .doc(collectionID)
        .collection("completed")
        .doc(_uuid.v4())
        .set(
      {
        "title": title,
        "description": description,
        "priority": priority,
        "date": date,
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
        .collection("completed")
        .doc(taskID)
        .delete();
  }

  Future<List<TaskModel>> tasks({
    required String collectionID,
  }) async {
    _account = accountManager.account;

    final dbTasks = await _account!
        .collection("collections")
        .doc(collectionID)
        .collection("completed")
        .get();

    if (dbTasks.docs.isEmpty) return [];

    return dbTasks.docs.map((task) {
      return TaskModel(
        id: task.id,
        title: task.data()["title"],
        description: task.data()["description"],
        priority: task.data()["priority"],
        date: task.data()["date"],
      );
    }).toList();
  }
}

final completedManager = _CompletedManager();
