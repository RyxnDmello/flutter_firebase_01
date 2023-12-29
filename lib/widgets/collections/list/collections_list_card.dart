import 'package:flutter/material.dart';

import '../../../database/collection_manager.dart';
import '../../../database/progress_manager.dart';
import '../../../database/completed_manager.dart';

import '../../../models/collection_model.dart';
import '../../../models/task_model.dart';

import './card/collections_list_card_name.dart';
import './card/collections_list_card_controller.dart';

class CollectionsListCard extends StatelessWidget {
  const CollectionsListCard({
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
      final progress = await progressManager.tasks(
        collectionID: collection.id,
      );

      final completed = await completedManager.tasks(
        collectionID: collection.id,
      );

      openProgressScreen(
        collection: collection,
        completed: completed,
        progress: progress,
      );
    }

    Future<void> deleteCollection() async {
      await collectionManager.deleteCollection(
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
            CollectionsListCardName(
              name: collection.name,
              icon: collection.icon,
            ),
            const SizedBox(
              height: 12.5,
            ),
            CollectionsListCardController(
              deleteCollection: deleteCollection,
              date: collection.date,
            ),
          ],
        ),
      ),
    );
  }
}
