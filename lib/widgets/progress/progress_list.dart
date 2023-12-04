import 'package:flutter/material.dart';

import '../../database/account_manager.dart';

import '../../models/task_model.dart';

import './list/progress_list_dismissible.dart';

import './progress_task.dart';

class ProgressList extends StatelessWidget {
  const ProgressList({
    required this.collectionID,
    required this.updateTasks,
    required this.progress,
    super.key,
  });

  final Future<void> Function() updateTasks;
  final List<TaskModel> progress;
  final String collectionID;

  @override
  Widget build(BuildContext context) {
    Future<void> addCompletedTask({
      required String taskID,
      required String title,
      required String description,
      required String image,
    }) async {
      await accountManager.addCompletedTask(
        collectionID: collectionID,
        description: description,
        image: image,
        title: title,
      );
    }

    Future<void> deleteProgressTask(String taskID) async {
      await accountManager.deleteProgressTask(
        collectionID: collectionID,
        taskID: taskID,
      );

      await updateTasks();
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 30),
      itemCount: progress.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(progress[index].id),
          onDismissed: (direction) async {
            if (direction == DismissDirection.endToStart) {
              await deleteProgressTask(
                progress[index].id,
              );

              return;
            }

            await addCompletedTask(
              taskID: progress[index].id,
              title: progress[index].title,
              description: progress[index].description,
              image: progress[index].image,
            );

            await deleteProgressTask(
              progress[index].id,
            );
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
