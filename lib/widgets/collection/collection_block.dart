import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/progress_provider.dart';
import '../../providers/completed_provider.dart';

import '../../models/collection_model.dart';

import '../../screens/progress.dart';

import './block/collection_block_image.dart';
import './block/collection_block_details.dart';
import './block/collection_block_name.dart';

class CollectionBlock extends ConsumerWidget {
  const CollectionBlock({
    required this.collection,
    super.key,
  });

  final CollectionModel collection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progressProviderRef = ref.watch(progressProvider.notifier);
    final completedProviderRef = ref.watch(completedProvider.notifier);

    Future<void> viewTasks() async {
      final progressTasks = await progressProviderRef.getProgressTasks(
        collectionID: collection.id,
      );

      final completedTasks = await completedProviderRef.getCompletedTasks(
        collectionID: collection.id,
      );

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return ProgressScreen(
              collection: collection,
              progress: progressTasks,
              completed: completedTasks,
            );
          },
        ),
      );
    }

    return GestureDetector(
      onTap: () => viewTasks(),
      child: Container(
        height: 125,
        width: double.infinity,
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
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
                    height: 10,
                  ),
                  const CollectionBlockDetails(
                    progress: [],
                    completed: [],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
