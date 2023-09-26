import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../database/account_manager.dart';

import '../models/task_model.dart';

final _date = DateFormat.yMMMMd('en_US').format(DateTime.now());

class CompletedProviderNotifier extends StateNotifier<List<TaskModel>> {
  CompletedProviderNotifier() : super([]);

  Future<void> addTask({
    required String collectionID,
    required String taskID,
    required String title,
    required String description,
    required String image,
  }) async {
    final task = TaskModel(
      id: taskID,
      title: title,
      description: description,
      image: image,
      date: _date,
    );

    await accountManager.addCompletedTask(
      collectionID: collectionID,
      task: task,
    );
  }

  Future<void> deleteTask({
    required String collectionID,
    required String taskID,
  }) async {
    await accountManager.deleteCompletedTask(
      collectionID: collectionID,
      taskID: taskID,
    );
  }

  Future<List<TaskModel>> getTasks({
    required String collectionID,
  }) async {
    state = [
      ...await accountManager.getCompletedTasks(
        id: collectionID,
      ),
    ];

    return state;
  }
}

final completedProvider =
    StateNotifierProvider<CompletedProviderNotifier, List<TaskModel>>((ref) {
  return CompletedProviderNotifier();
});
