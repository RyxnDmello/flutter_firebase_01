import 'package:flutter/material.dart';

import './header/task_header_button.dart';
import './header/task_header_priority.dart';
import './header/task_header_duration.dart';

class TaskHeader extends StatelessWidget {
  const TaskHeader({
    required this.onDeleteTask,
    required this.onAddTask,
    required this.priorityColor,
    required this.priorityType,
    required this.duration,
    super.key,
  });

  final Future<void> Function()? onDeleteTask;
  final Future<void> Function()? onAddTask;
  final Color priorityColor;
  final String priorityType;
  final String duration;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (onAddTask != null)
              TaskHeaderButton(
                onTap: onAddTask,
                icon: Icons.check,
              ),
            if (onDeleteTask != null)
              TaskHeaderButton(
                onTap: onDeleteTask,
                icon: Icons.close,
              ),
            const SizedBox(
              width: 10,
            ),
            TaskHeaderPriority(
              priorityColor: priorityColor,
              priorityType: priorityType,
            ),
          ],
        ),
        TaskHeaderDuration(
          duration: duration,
        ),
      ],
    );
  }
}
