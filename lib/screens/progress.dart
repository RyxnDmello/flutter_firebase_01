import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/collection_provider.dart';

import '../models/collection_model.dart';
import '../models/task_model.dart';

import '../widgets/progress/progress_header.dart';
import '../widgets/progress/progress_form.dart';
import '../widgets/progress/progress_list.dart';
import '../widgets/progress/progress_empty.dart';

import './completed.dart';

class ProgressScreen extends ConsumerStatefulWidget {
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
  ConsumerState<ProgressScreen> createState() {
    return _ProgressScreenState();
  }
}

class _ProgressScreenState extends ConsumerState<ProgressScreen> {
  List<TaskModel> _progress = [];
  List<TaskModel> _completed = [];

  @override
  void initState() {
    super.initState();
    _progress = widget.progress;
    _completed = widget.completed;
  }

  void _updateTasks({
    required List<TaskModel> progress,
    required List<TaskModel> completed,
  }) {
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
    final tasks =
        await Navigator.of(context).push<Map<String, List<TaskModel>>>(
      MaterialPageRoute(
        builder: (context) {
          return CompletedScreen(
            collection: widget.collection,
            completed: _completed,
          );
        },
      ),
    );

    _updateTasks(
      progress: tasks!["progress"]!,
      completed: tasks["completed"]!,
    );
  }

  @override
  Widget build(BuildContext context) {
    final collectionProviderRef = ref.watch(collectionProvider.notifier);

    Future<void> closeProgressScreen() async {
      Navigator.of(context).pop(
        await collectionProviderRef.getCollections(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () => closeProgressScreen(),
          iconSize: 26.5,
          splashRadius: 25,
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => _openForm(),
            iconSize: 30,
            splashRadius: 25,
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ProgressHeader(
            collection: widget.collection,
            totalProgressTasks: _progress.length,
            totalCompletedTasks: _completed.length,
            openCompletedScreen: _openCompletedScreen,
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
            Expanded(
              child: ProgressList(
                collectionID: widget.collection.id,
                updateTasks: _updateTasks,
                progress: _progress,
              ),
            ),
        ],
      ),
    );
  }
}
