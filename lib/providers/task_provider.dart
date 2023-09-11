import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../database/account_manager.dart';

import '../models/task_model.dart';

final _date = DateFormat.yMMMMd('en_US').format(DateTime.now());
const _uuid = Uuid();

class TaskProviderNotifier extends StateNotifier<List<TaskModel>> {
  TaskProviderNotifier() : super([]);

  Future<void> addProgressTask({
    required String collectionID,
    required String title,
    required String description,
    required String image,
  }) async {
    final task = TaskModel(
      id: _uuid.v4(),
      title: title,
      description: description,
      image: image,
      date: _date,
    );

    await accountManager.addProgressTask(
      collectionID: collectionID,
      task: task,
    );

    state = [task, ...state];
  }

  Future<List<TaskModel>> getProgressTasks({
    required String collectionID,
  }) async {
    state = [...await accountManager.getProgressTasks(id: collectionID)];
    return state;
  }
}

final taskProvider =
    StateNotifierProvider<TaskProviderNotifier, List<TaskModel>>((ref) {
  return TaskProviderNotifier();
});
