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
      height: 165,
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(0, 5),
            blurRadius: 5,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            task.image,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
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
          )
        ],
      ),
    );
  }
}
