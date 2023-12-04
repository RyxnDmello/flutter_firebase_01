import 'package:flutter/material.dart';

import '../../database/account_manager.dart';

import '../models/collection_model.dart';
import '../models/task_model.dart';

import '../widgets/progress/progress_header.dart';
import '../widgets/progress/progress_form.dart';
import '../widgets/progress/progress_list.dart';
import '../widgets/progress/progress_empty.dart';

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

    _updateTasks();
  }

  void _closeProgressScreen() {
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              updateTasks: _updateTasks,
            ),
            if (_progress.isEmpty)
              ProgressEmpty(
                openForm: _openForm,
              ),
            if (_progress.isNotEmpty)
              const SizedBox(
                height: 20,
              ),
            if (_progress.isNotEmpty)
              ProgressList(
                collectionID: widget.collection.id,
                updateTasks: _updateTasks,
                progress: _progress,
              ),
          ],
        ),
      ),
    );
  }
}
