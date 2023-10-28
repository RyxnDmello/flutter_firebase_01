import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/progress_provider.dart';
import '../providers/completed_provider.dart';

import '../models/collection_model.dart';
import '../models/task_model.dart';

import '../widgets/completed/completed_header.dart';
import '../widgets/completed/completed_list.dart';

class CompletedScreen extends ConsumerStatefulWidget {
  const CompletedScreen({
    required this.collection,
    required this.completed,
    super.key,
  });

  final CollectionModel collection;
  final List<TaskModel> completed;

  @override
  ConsumerState<CompletedScreen> createState() {
    return _CompletedScreenState();
  }
}

class _CompletedScreenState extends ConsumerState<CompletedScreen> {
  List<TaskModel> _completed = [];

  @override
  void initState() {
    super.initState();
    _completed = widget.completed;
  }

  void _updateCompletedTasks({required List<TaskModel> completed}) {
    setState(() => _completed = completed);
  }

  @override
  Widget build(BuildContext context) {
    final progressProviderRef = ref.watch(progressProvider.notifier);
    final completedProviderRef = ref.watch(completedProvider.notifier);

    Future<void> closeCompletedScreen() async {
      Navigator.of(context).pop(
        {
          "progress": await progressProviderRef.getTasks(
            collectionID: widget.collection.id,
          ),
          "completed": await completedProviderRef.getTasks(
            collectionID: widget.collection.id,
          ),
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () => closeCompletedScreen(),
          iconSize: 26.5,
          splashRadius: 25,
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CompletedHeader(
            closeCompletedScreen: closeCompletedScreen,
            collection: widget.collection,
            totalTasks: _completed.length,
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: CompletedList(
              updateCompletedTasks: _updateCompletedTasks,
              collectionID: widget.collection.id,
              completed: _completed,
            ),
          )
        ],
      ),
    );
  }
}
