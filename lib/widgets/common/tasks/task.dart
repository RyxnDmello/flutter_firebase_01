import 'package:flutter/material.dart';

import '../../../models/task_model.dart';

import './task/task_header.dart';
import './task/task_priority.dart';
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
    required String image,
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
        border: Border.all(
          color: const Color.fromARGB(200, 255, 255, 255),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TaskPriority(
            color: Colors.red,
          ),
          const SizedBox(
            height: 20,
          ),
          TaskHeader(
            onAddTask: onAddTask != null
                ? () async {
                    await onAddTask!(
                      title: task.title,
                      description: task.description,
                      image: task.image,
                    );

                    await onDeleteTask!(
                      taskID: task.id,
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
            color: Colors.red,
            date: task.date,
          ),
          const SizedBox(
            height: 20,
          ),
          TaskTitle(
            title: task.title,
          ),
          const SizedBox(
            height: 10,
          ),
          TaskDescription(
            description: task.description,
          ),
        ],
      ),
    );
  }
}
