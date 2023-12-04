import 'package:flutter/material.dart';

import '../../database/account_manager.dart';

import '../../models/collection_model.dart';

import './header/progress_header_controller.dart';
import './header/progress_header_details.dart';
import './header/progress_header_title.dart';

class ProgressHeader extends StatelessWidget {
  const ProgressHeader({
    required this.collection,
    required this.openCompletedScreen,
    required this.totalCompletedTasks,
    required this.totalProgressTasks,
    required this.updateTasks,
    super.key,
  });

  final void Function() openCompletedScreen;
  final Future<void> Function() updateTasks;
  final CollectionModel collection;
  final int totalCompletedTasks;
  final int totalProgressTasks;

  @override
  Widget build(BuildContext context) {
    double getCompletedPercentage() {
      int total = totalProgressTasks + totalCompletedTasks;
      if (total == 0) return 0;
      return (totalCompletedTasks * 100) / total;
    }

    Future<void> clearProgressTasks() async {
      await accountManager.clearProgressTasks(
        collectionID: collection.id,
      );

      await updateTasks();
    }

    return Container(
      height: 180,
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            offset: Offset(0, 5),
            blurRadius: 10,
          )
        ],
      ),
      child: Stack(
        children: [
          Image.asset(
            collection.image,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProgressHeaderTitle(
                  name: collection.name,
                  icon: collection.icon,
                ),
                const SizedBox(
                  height: 10,
                ),
                ProgressHeaderDetails(
                  active: totalProgressTasks.toString(),
                  percentage: getCompletedPercentage().toStringAsFixed(2),
                ),
                const SizedBox(
                  height: 10,
                ),
                ProgressHeaderController(
                  openCompletedScreen: openCompletedScreen,
                  clearCollection: () async {
                    await clearProgressTasks();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
