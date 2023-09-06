import 'package:flutter/material.dart';

import './tasks/progress_task_image.dart';
import './tasks/progress_task_date.dart';
import './tasks/progress_task_title.dart';
import './tasks/progress_task_description.dart';

import '../../models/task_model.dart';

class ProgressTask extends StatelessWidget {
  const ProgressTask({required this.task, super.key});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        alignment: Alignment.center,
        children: [
          ProgressTaskImage(
            image: task.image,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProgressTaskDate(
                  date: task.date,
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
          ),
        ],
      ),
    );
  }
}
