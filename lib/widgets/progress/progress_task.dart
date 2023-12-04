import 'package:flutter/material.dart';

import './task/progress_task_date.dart';
import './task/progress_task_title.dart';
import './task/progress_task_description.dart';

import '../../models/task_model.dart';

class ProgressTask extends StatelessWidget {
  const ProgressTask({
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProgressTaskDate(
            date: task.date,
          ),
          const SizedBox(
            height: 20,
          ),
          ProgressTaskTitle(
            title: task.title,
          ),
          const SizedBox(
            height: 5,
          ),
          ProgressTaskDescription(
            description: task.description,
          ),
        ],
      ),
    );
  }
}
