import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/collection_provider.dart';
import '../../providers/progress_provider.dart';
import '../../providers/completed_provider.dart';

import '../../models/collection_model.dart';
import '../../models/task_model.dart';

import './block/collection_block_name.dart';
import './block/collection_block_controller.dart';
import './block/collection_block_image.dart';

class CollectionBlock extends ConsumerWidget {
  const CollectionBlock({
    required this.openProgressScreen,
    required this.updateCollections,
    required this.collection,
    super.key,
  });

  final CollectionModel collection;

  final void Function({
    required List<CollectionModel> collections,
  }) updateCollections;

  final void Function({
    required CollectionModel collection,
    required List<TaskModel> progress,
    required List<TaskModel> completed,
  }) openProgressScreen;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectionProviderRef = ref.watch(collectionProvider.notifier);
    final progressProviderRef = ref.watch(progressProvider.notifier);
    final completedProviderRef = ref.watch(completedProvider.notifier);

    Future<void> openScreen() async {
      openProgressScreen(
        collection: collection,
        progress: await progressProviderRef.getTasks(
          collectionID: collection.id,
        ),
        completed: await completedProviderRef.getTasks(
          collectionID: collection.id,
        ),
      );
    }

    Future<void> deleteCollection() async {
      await collectionProviderRef.deleteCollection(
        collectionID: collection.id,
      );

      updateCollections(
        collections: await collectionProviderRef.getCollections(),
      );
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
