import 'package:flutter/material.dart';

import '../../database/account_manager.dart';

import '../../models/collection_model.dart';
import '../../models/task_model.dart';

import './block/collection_block_name.dart';
import './block/collection_block_controller.dart';
import './block/collection_block_image.dart';

class CollectionBlock extends StatelessWidget {
  const CollectionBlock({
    required this.openProgressScreen,
    required this.updateCollections,
    required this.collection,
    super.key,
  });

  final CollectionModel collection;

  final Future<void> Function() updateCollections;

  final void Function({
    required CollectionModel collection,
    required List<TaskModel> progress,
    required List<TaskModel> completed,
  }) openProgressScreen;

  @override
  Widget build(BuildContext context) {
    Future<void> openScreen() async {
      final progress = await accountManager.getProgressTasks(
        id: collection.id,
      );

      final completed = await accountManager.getCompletedTasks(
        id: collection.id,
      );

      openProgressScreen(
        collection: collection,
        completed: completed,
        progress: progress,
      );
    }

    Future<void> deleteCollection() async {
      await accountManager.deleteCollection(
        collectionID: collection.id,
      );

      await updateCollections();
    }

    return GestureDetector(
      onTap: () => openScreen(),
      child: Container(
        height: 140,
        width: double.infinity,
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black87,
              offset: Offset(0, 5),
              blurRadius: 10,
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            CollectionBlockImage(
              image: collection.image,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CollectionBlockName(
                    name: collection.name,
                    icon: collection.icon,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CollectionBlockController(
                    deleteCollection: deleteCollection,
                    date: collection.date,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
