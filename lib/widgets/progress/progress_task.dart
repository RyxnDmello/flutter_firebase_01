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
      child: Container(
        height: 165,
        width: double.infinity,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
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
            ),
          ],
        ),
      ),
    );
  }
}
