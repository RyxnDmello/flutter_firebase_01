import 'package:flutter/material.dart';

import '../../../models/task_model.dart';

import './task/task_header.dart';
import './task/task_title.dart';
import './task/task_description.dart';
import './task/task_overdue.dart';

final _currentDate = DateTime.now();

class Task extends StatelessWidget {
  const Task({
    required this.onDeleteTask,
    required this.isProgress,
    required this.onAddTask,
    required this.task,
    super.key,
  });

  final bool isProgress;
  final TaskModel task;

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
    final taskDate = DateTime.parse(task.date);
    final timePeriod = taskDate.difference(_currentDate);

    String? duration() {
      final inDays = timePeriod.inDays;
      final inHours = timePeriod.inHours;

      if (inDays < 0) return null;
      return inDays == 0 ? "${inHours}H" : "${inDays}D";
    }

    String? overdue() {
      final inDays = timePeriod.inDays;

      if (inDays > -1) return null;
      return inDays.abs() == 1 ? "${inDays.abs()} Day" : "${inDays.abs()} Days";
    }

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
            priorityColor: priorities.values.elementAt(task.priority),
            priorityType: priorities.keys.elementAt(task.priority),
            duration: isProgress ? duration() : null,
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
          if (overdue() != null)
            const SizedBox(
              height: 15,
            ),
          if (overdue() != null)
            TaskOverdue(
              overdue: overdue()!,
            ),
        ],
      ),
    );
  }
}
