import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/task_provider.dart';

import '../../models/task_model.dart';

import 'list/progress_list_dismissible.dart';

import './progress_task.dart';

class ProgressList extends ConsumerWidget {
  const ProgressList({
    required this.updateProgressTasks,
    required this.collectionID,
    required this.progress,
    super.key,
  });

  final void Function({required List<TaskModel> tasks}) updateProgressTasks;
  final List<TaskModel> progress;
  final String collectionID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskProviderRef = ref.watch(taskProvider.notifier);

    Future<void> deleteProgressTask(String taskID) async {
      await taskProviderRef.deleteProgressTask(
        collectionID: collectionID,
        taskID: taskID,
      );

      updateProgressTasks(
        tasks: await taskProviderRef.getProgressTasks(
          collectionID: collectionID,
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 30),
      itemCount: progress.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(progress[index].id),
          onDismissed: (direction) {
            if (direction == DismissDirection.endToStart) {
              deleteProgressTask(progress[index].id);
              return;
            }
          },
          background: const ProgressListDismissible(
            alignment: Alignment.centerLeft,
            icon: Icons.check_circle_sharp,
            color: Colors.green,
          ),
          secondaryBackground: const ProgressListDismissible(
            alignment: Alignment.centerRight,
            icon: Icons.remove_circle_sharp,
            color: Colors.red,
          ),
          child: ProgressTask(
            task: progress[index],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 15,
        );
      },
    );
  }
}
