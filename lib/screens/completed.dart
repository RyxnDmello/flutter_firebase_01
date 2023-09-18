import 'package:flutter/material.dart';

import '../models/collection_model.dart';

import '../widgets/completed/completed_header.dart';

import '../models/task_model.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({
    required this.collection,
    required this.completed,
    super.key,
  });

  final CollectionModel collection;
  final List<TaskModel> completed;

  @override
  State<CompletedScreen> createState() {
    return _CompletedScreenState();
  }
}

class _CompletedScreenState extends State<CompletedScreen> {
  List<TaskModel> _completed = [];

  @override
  void initState() {
    super.initState();
    _completed = widget.completed;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CompletedHeader(
            collection: widget.collection,
            totalTasks: _completed.length,
          ),
        ],
      ),
    );
  }
}
