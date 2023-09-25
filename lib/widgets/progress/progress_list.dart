import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/progress_provider.dart';
import '../../providers/completed_provider.dart';

import '../../models/task_model.dart';

import 'list/progress_list_dismissible.dart';

import './progress_task.dart';

class ProgressList extends ConsumerWidget {
  const ProgressList({
    required this.collectionID,
    required this.updateTasks,
    required this.progress,
    super.key,
  });

  final void Function({
    required List<TaskModel> progress,
    required List<TaskModel> completed,
  }) updateTasks;

  final List<TaskModel> progress;
  final String collectionID;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progressProviderRef = ref.watch(progressProvider.notifier);
    final completedProviderRef = ref.watch(completedProvider.notifier);

    Future<void> addCompletedTask({
      required String taskID,
      required String title,
      required String description,
      required String image,
    }) async {
      await completedProviderRef.addTask(
        collectionID: collectionID,
        taskID: taskID,
        title: title,
        description: description,
        image: image,
      );
    }

    Future<void> deleteProgressTask(String taskID) async {
      await progressProviderRef.deleteTask(
        collectionID: collectionID,
        taskID: taskID,
      );

      updateTasks(
        progress: await progressProviderRef.getTasks(
          collectionID: collectionID,
        ),
        completed: await completedProviderRef.getTasks(
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
          onDismissed: (direction) async {
            if (direction == DismissDirection.endToStart) {
              await deleteProgressTask(progress[index].id);
              return;
            }

            await addCompletedTask(
              taskID: progress[index].id,
              title: progress[index].title,
              description: progress[index].description,
              image: progress[index].image,
            );

            await deleteProgressTask(progress[index].id);
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
