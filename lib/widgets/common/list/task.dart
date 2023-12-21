import 'package:flutter/material.dart';

import '../../../models/task_model.dart';

import './task/task_header.dart';
import './task/task_title.dart';
import './task/task_description.dart';

class Task extends StatelessWidget {
  const Task({
    required this.onDeleteTask,
    required this.onAddTask,
    required this.task,
    super.key,
  });

  final Future<void> Function({
    required String title,
    required String description,
    required int priority,
    required String date,
  })? onAddTask;

  final Future<void> Function({
    required String taskID,
  })? onDeleteTask;

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            offset: Offset(0, 5),
            spreadRadius: 2,
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TaskHeader(
            onAddTask: onAddTask != null
                ? () async {
                    await onDeleteTask!(
                      taskID: task.id,
                    );

                    await onAddTask!(
                      title: task.title,
                      description: task.description,
                      priority: task.priority,
                      date: task.date,
                    );
                  }
                : null,
            onDeleteTask: onDeleteTask != null
                ? () async {
                    await onDeleteTask!(
                      taskID: task.id,
                    );
                  }
                : null,
            priorityColor: priorities.values.elementAt(
              task.priority,
            ),
            priorityType: priorities.keys.elementAt(
              task.priority,
            ),
            days: "10d",
          ),
          const SizedBox(
            height: 15,
          ),
          TaskTitle(
            title: task.title,
          ),
          const SizedBox(
            height: 8,
          ),
          TaskDescription(
            description: task.description,
          ),
        ],
      ),
    );
  }
}
