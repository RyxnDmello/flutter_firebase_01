import 'package:flutter/material.dart';

import '../models/task_model.dart';

class CompletedScreen extends StatelessWidget {
  const CompletedScreen({
    required this.completed,
    super.key,
  });

  final List<TaskModel> completed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Text("${completed.length}"),
    );
  }
}
