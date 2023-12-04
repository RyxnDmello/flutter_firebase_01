import 'package:flutter/material.dart';

import '../../models/task_model.dart';

import './task/completed_task_date.dart';
import './task/completed_task_title.dart';
import './task/completed_task_description.dart';

class CompletedTask extends StatelessWidget {
  const CompletedTask({
    required this.task,
    super.key,
  });

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            task.image,
          ),
          fit: BoxFit.cover,
          opacity: 0.85,
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(0, 5),
            blurRadius: 5,
          ),
        ],
        borderRadius: BorderRadius.circular(5),
        color: Colors.black,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CompletedTaskDate(
            date: task.date,
          ),
          const SizedBox(
            height: 20,
          ),
          CompletedTaskTitle(
            title: task.title,
          ),
          const SizedBox(
            height: 5,
          ),
          CompletedTaskDescription(
            description: task.description,
          ),
        ],
      ),
    );
  }
}
