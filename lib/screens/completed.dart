import 'package:flutter/material.dart';

import '../database/account_manager.dart';

import '../models/collection_model.dart';
import '../models/task_model.dart';

import '../widgets/common/header.dart';
import '../widgets/common/list.dart';

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

  Future<void> _updateCompletedTasks() async {
    final completed = await accountManager.getCompletedTasks(
      id: widget.collection.id,
    );

    setState(() => _completed = completed);
  }

  Future<void> _deleteCompletedTask({
    required String taskID,
  }) async {
    await accountManager.deleteCompletedTask(
      collectionID: widget.collection.id,
      taskID: taskID,
    );

    await _updateCompletedTasks();
  }

  Future<void> _closeCompletedScreen() async {
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Header(
            completedLength: widget.completed.length,
            onOpenScreen: _closeCompletedScreen,
            collection: widget.collection,
            progressLength: null,
            isProgress: false,
            onOpenForm: null,
            onClear: null,
          ),
          const SizedBox(
            height: 20,
          ),
          TasksList(
            collectionID: widget.collection.id,
            onDeleteTask: _deleteCompletedTask,
            tasks: _completed,
            onAddTask: null,
          ),
        ],
      ),
    );
  }
}
