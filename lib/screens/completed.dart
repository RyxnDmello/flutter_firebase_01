import 'package:flutter/material.dart';

import '../database/completed_manager.dart';

import '../models/collection_model.dart';
import '../models/task_model.dart';

import '../widgets/common/header.dart';
import '../widgets/common/list.dart';
import '../widgets/common/loading_indicator.dart';

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

  Future<void> _deleteCompletedTask({
    required String taskID,
  }) async {
    showLoadingIndicator(
      context: context,
    );

    await completedManager.deleteTask(
      collectionID: widget.collection.id,
      taskID: taskID,
    );

    final completed = await completedManager.tasks(
      collectionID: widget.collection.id,
    );

    setState(() => _completed = completed);
    _closeLoadingIndicator();
  }

  void _closeLoadingIndicator() {
    Navigator.of(context).pop();
  }

  Future<void> _closeCompletedScreen() async {
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          bottom: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Header(
              onOpenScreen: _closeCompletedScreen,
              completedLength: _completed.length,
              collection: widget.collection,
              progressLength: null,
              isProgress: false,
              onOpenForm: null,
              onClear: null,
            ),
            const SizedBox(
              height: 30,
            ),
            TasksList(
              collectionID: widget.collection.id,
              onDeleteTask: _deleteCompletedTask,
              tasks: _completed,
              isProgress: false,
              onAddTask: null,
            ),
          ],
        ),
      ),
    );
  }
}
