import 'package:flutter/material.dart';

import '../database/account_manager.dart';

import '../models/collection_model.dart';
import '../models/task_model.dart';

import '../widgets/completed/completed_header.dart';
import '../widgets/completed/completed_list.dart';

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

  Future<void> _closeCompletedScreen() async {
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () => _closeCompletedScreen(),
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
            closeCompletedScreen: _closeCompletedScreen,
            collection: widget.collection,
            totalTasks: _completed.length,
          ),
          const SizedBox(
            height: 20,
          ),
          CompletedList(
            updateCompletedTasks: _updateCompletedTasks,
            collectionID: widget.collection.id,
            completed: _completed,
          )
        ],
      ),
    );
  }
}
