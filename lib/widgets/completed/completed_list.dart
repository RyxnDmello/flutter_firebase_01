import 'package:flutter/material.dart';

import '../../models/task_model.dart';

import './completed_task.dart';

class CompletedList extends StatelessWidget {
  const CompletedList({
    required this.completed,
    super.key,
  });

  final List<TaskModel> completed;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 30),
      itemCount: completed.length,
      itemBuilder: (context, index) {
        return CompletedTask(
          task: completed[index],
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
