import 'package:flutter/material.dart';

import '../models/collection_model.dart';
import '../models/task_model.dart';

import '../widgets/progress/progress_app_bar.dart';
import '../widgets/progress/progress_task.dart';
import '../widgets/progress/progress_form.dart';
import '../widgets/progress/progress_empty.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({
    required this.progress,
    required this.collection,
    super.key,
  });

  final CollectionModel collection;
  final List<TaskModel> progress;

  @override
  State<ProgressScreen> createState() {
    return _ProgressScreenState();
  }
}

class _ProgressScreenState extends State<ProgressScreen> {
  List<TaskModel> _progress = [];

  void _updateProgressTasks({required List<TaskModel> tasks}) {
    setState(() => _progress = tasks);
  }

  @override
  void initState() {
    super.initState();
    _progress = widget.progress;
  }

  @override
  Widget build(BuildContext context) {
    void openForm() {
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
            updateProgressTasks: _updateProgressTasks,
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () => openForm(),
            icon: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ProgressAppBar(
            collection: widget.collection,
          ),
          if (_progress.isEmpty)
            ProgressEmpty(
              openForm: openForm,
            ),
          if (_progress.isNotEmpty)
            const SizedBox(
              height: 20,
            ),
          if (_progress.isNotEmpty)
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 30),
                itemCount: _progress.length,
                itemBuilder: (context, index) {
                  return ProgressTask(
                    task: _progress[index],
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 15,
                  );
                },
              ),
            )
        ],
      ),
    );
  }
}
