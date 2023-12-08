import 'package:flutter/material.dart';

class TaskPriority extends StatelessWidget {
  const TaskPriority({
    required this.color,
    super.key,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: color,
      ),
    );
  }
}
