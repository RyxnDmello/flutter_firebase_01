import 'package:flutter/material.dart';

import '../../models/task_model.dart';

import './list/task.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    required this.collectionID,
    required this.onDeleteTask,
    required this.isProgress,
    required this.onAddTask,
    required this.tasks,
    super.key,
  });

  final List<TaskModel> tasks;
  final String collectionID;
  final bool isProgress;

  final Future<void> Function({
    required String title,
    required String description,
    required int priority,
    required String date,
  })? onAddTask;

  final Future<void> Function({
    required String taskID,
  })? onDeleteTask;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 0,
      ),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return Task(
          isProgress: isProgress,
          onDeleteTask: onDeleteTask,
          onAddTask: onAddTask,
          task: tasks[index],
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 15,
        );
      },
    );
  }
}
