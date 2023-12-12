import 'package:flutter/material.dart';

import '../../models/collection_model.dart';
import '../../models/task_model.dart';

import './list/collections_list_block.dart';

class CollectionsList extends StatelessWidget {
  const CollectionsList({
    required this.updateCollections,
    required this.onOpenProgressScreen,
    required this.collections,
    super.key,
  });

  final List<CollectionModel> collections;
  final Future<void> Function() updateCollections;

  final Future<void> Function({
    required CollectionModel collection,
    required List<TaskModel> progress,
    required List<TaskModel> completed,
  }) onOpenProgressScreen;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(
        right: 15,
        left: 15,
      ),
      itemCount: collections.length,
      itemBuilder: (context, index) {
        return CollectionsListBlock(
          openProgressScreen: onOpenProgressScreen,
          updateCollections: updateCollections,
          collection: collections[index],
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
