import 'package:flutter/material.dart';

import '../../../database/account_manager.dart';

import '../../../models/collection_model.dart';
import '../../../models/task_model.dart';

import './block/collections_list_block_name.dart';
import './block/collections_list_block_controller.dart';

class CollectionsListBlock extends StatelessWidget {
  const CollectionsListBlock({
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
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              collection.image,
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black87,
              offset: Offset(0, 5),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CollectionsListBlockName(
              name: collection.name,
              icon: collection.icon,
            ),
            const SizedBox(
              height: 12.5,
            ),
            CollectionsListBlockController(
              deleteCollection: deleteCollection,
              date: collection.date,
            ),
          ],
        ),
      ),
    );
  }
}
