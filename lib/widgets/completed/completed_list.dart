import 'package:flutter/material.dart';

import '../../database/account_manager.dart';

import '../../models/task_model.dart';

import './list/completed_list_dismissible.dart';

import './completed_task.dart';

class CompletedList extends StatelessWidget {
  const CompletedList({
    required this.updateCompletedTasks,
    required this.collectionID,
    required this.completed,
    super.key,
  });

  final Future<void> Function() updateCompletedTasks;
  final List<TaskModel> completed;
  final String collectionID;

  @override
  Widget build(BuildContext context) {
    Future<void> deleteCompletedTask({
      required String taskID,
    }) async {
      await accountManager.deleteCompletedTask(
        collectionID: collectionID,
        taskID: taskID,
      );

      await updateCompletedTasks();
    }

    return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 30),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: completed.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(
            completed[index].id,
          ),
          onDismissed: (direction) async {
            await deleteCompletedTask(
              taskID: completed[index].id,
            );
          },
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
