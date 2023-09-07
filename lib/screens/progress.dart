import 'package:flutter/material.dart';

import '../models/collection_model.dart';
import '../models/task_model.dart';

import '../widgets/progress/progress_app_bar.dart';
import '../widgets/progress/progress_task.dart';
import '../widgets/progress/progress_form.dart';
import '../widgets/progress/progress_empty.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({
    required this.collection,
    super.key,
  });

  final CollectionModel collection;

  @override
  State<ProgressScreen> createState() {
    return _ProgressScreenState();
  }
}

class _ProgressScreenState extends State<ProgressScreen> {
  @override
  Widget build(BuildContext context) {
    List<TaskModel> progress = widget.collection.progress;

    void updateTasks(List<TaskModel> tasks) {
      setState(() => progress = tasks);
    }

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
            updateTasks: updateTasks,
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ProgressAppBar(
              collection: widget.collection,
            ),
            if (progress.isEmpty)
              ProgressEmpty(
                openForm: openForm,
              ),
            if (progress.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ...progress.map(
                      (task) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ProgressTask(
                              task: task,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
