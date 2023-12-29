import 'package:flutter/material.dart';

import '../database/progress_manager.dart';
import '../database/completed_manager.dart';

import '../models/collection_model.dart';
import '../models/task_model.dart';

import '../widgets/common/header.dart';
import '../widgets/common/list.dart';
import '../widgets/common/empty.dart';

import '../widgets/progress/progress_form.dart';

import './completed.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({
    required this.collection,
    required this.progress,
    required this.completed,
    super.key,
  });

  final CollectionModel collection;
  final List<TaskModel> progress;
  final List<TaskModel> completed;

  @override
  State<ProgressScreen> createState() {
    return _ProgressScreenState();
  }
}

class _ProgressScreenState extends State<ProgressScreen> {
  List<TaskModel> _progress = [];
  List<TaskModel> _completed = [];

  @override
  void initState() {
    super.initState();
    _progress = widget.progress;
    _completed = widget.completed;
  }

  Future<void> _updateTasks() async {
    final progress = await progressManager.tasks(
      collectionID: widget.collection.id,
    );

    final completed = await completedManager.tasks(
      collectionID: widget.collection.id,
    );

    setState(() {
      _progress = progress;
      _completed = completed;
    });
  }

  Future<void> _addCompletedTask({
    required String title,
    required String description,
    required int priority,
    required String date,
  }) async {
    await completedManager.addTask(
      collectionID: widget.collection.id,
      description: description,
      priority: priority,
      title: title,
      date: date,
    );

    await _updateTasks();
  }

  Future<void> _deleteProgressTask({
    required String taskID,
  }) async {
    await progressManager.deleteTask(
      collectionID: widget.collection.id,
      taskID: taskID,
    );

    await _updateTasks();
  }

  Future<void> _clearProgressTasks() async {
    await progressManager.clearTasks(
      collectionID: widget.collection.id,
    );

    await _updateTasks();
  }

  void _openForm() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) {
        return ProgressForm(
          collection: widget.collection,
          updateTasks: _updateTasks,
        );
      },
    );
  }

  Future<void> _openCompletedScreen() async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return CompletedScreen(
            collection: widget.collection,
            completed: _completed,
          );
        },
      ),
    );

    await _updateTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Header(
              collection: widget.collection,
              progressLength: _progress.length,
              completedLength: _completed.length,
              onOpenScreen: _openCompletedScreen,
              onClear: _clearProgressTasks,
              onOpenForm: _openForm,
              isProgress: true,
            ),
            if (_progress.isEmpty)
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 25,
                  top: 80,
                ),
                child: Empty(
                  image: "./lib/images/progress/empty.png",
                  label: "CREATE TASK",
                  openForm: _openForm,
                  size: 325,
                ),
              ),
            if (_progress.isNotEmpty)
              const SizedBox(
                height: 20,
              ),
            if (_progress.isNotEmpty)
              TasksList(
                collectionID: widget.collection.id,
                onDeleteTask: _deleteProgressTask,
                onAddTask: _addCompletedTask,
                tasks: _progress,
                isProgress: true,
              ),
          ],
        ),
      ),
    );
  }
}
