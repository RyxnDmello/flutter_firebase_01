import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/completed_provider.dart';

import '../../models/task_model.dart';

import './list/completed_list_dismissible.dart';

import './completed_task.dart';

class CompletedList extends ConsumerWidget {
  const CompletedList({
    required this.updateCompletedTasks,
    required this.collectionID,
    required this.completed,
    super.key,
  });

  final List<TaskModel> completed;
  final String collectionID;

  final void Function({
    required List<TaskModel> completed,
  }) updateCompletedTasks;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final completedProviderRef = ref.watch(completedProvider.notifier);

    Future<void> deleteCompletedTask({
      required String taskID,
    }) async {
      await completedProviderRef.deleteTask(
        collectionID: collectionID,
        taskID: taskID,
      );

      updateCompletedTasks(
        completed: await completedProviderRef.getTasks(
          collectionID: collectionID,
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 30),
      itemCount: completed.length,
      itemBuilder: (context, index) {
        return Dismissible(
          onDismissed: (direction) async {
            await deleteCompletedTask(
              taskID: completed[index].id,
            );
          },
          key: Key(completed[index].id),
          background: const CompletedListDismissible(
            alignment: Alignment.centerLeft,
            icon: Icons.delete_forever,
            color: Colors.red,
          ),
          secondaryBackground: const CompletedListDismissible(
            alignment: Alignment.centerRight,
            icon: Icons.delete_forever,
            color: Colors.red,
          ),
          child: CompletedTask(
            task: completed[index],
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
