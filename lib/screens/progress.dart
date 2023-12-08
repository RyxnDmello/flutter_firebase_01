import 'package:flutter/material.dart';

import '../../database/account_manager.dart';

import '../models/collection_model.dart';
import '../models/task_model.dart';

import '../widgets/common/empty_list.dart';
import '../widgets/common/tasks_list.dart';

import '../widgets/progress/progress_header.dart';
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
    final progress = await accountManager.getProgressTasks(
      id: widget.collection.id,
    );

    final completed = await accountManager.getCompletedTasks(
      id: widget.collection.id,
    );

    setState(() {
      _progress = progress;
      _completed = completed;
    });
  }

  Future<void> _addCompletedTask({
    required String description,
    required String title,
    required String image,
  }) async {
    await accountManager.addCompletedTask(
      collectionID: widget.collection.id,
      description: description,
      image: image,
      title: title,
    );

    await _updateTasks();
  }

  Future<void> _deleteProgressTask({
    required String taskID,
  }) async {
    await accountManager.deleteProgressTask(
      collectionID: widget.collection.id,
      taskID: taskID,
    );

    await _updateTasks();
  }

  Future<void> _clearProgressTasks() async {
    await accountManager.clearProgressTasks(
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

  void _closeProgressScreen() {
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () => _closeProgressScreen(),
          iconSize: 26.5,
          splashRadius: 25,
          color: Colors.white,
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => _openForm(),
            iconSize: 30,
            splashRadius: 25,
            color: Colors.white,
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ProgressHeader(
              collection: widget.collection,
              totalProgressTasks: _progress.length,
              totalCompletedTasks: _completed.length,
              openCompletedScreen: _openCompletedScreen,
              clearCollection: _clearProgressTasks,
            ),
            if (_progress.isEmpty)
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 25,
                  top: 80,
                ),
                child: EmptyList(
                  image: "./lib/images/progress/empty.png",
                  label: "CREATE TASK",
                  openForm: _openForm,
                  isDark: true,
                  size: 265,
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
              ),
          ],
        ),
      ),
    );
  }
}
