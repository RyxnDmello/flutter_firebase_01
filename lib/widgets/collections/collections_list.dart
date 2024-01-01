import 'package:flutter/material.dart';

import '../../models/collection_model.dart';

import './list/collections_list_card.dart';

class CollectionsList extends StatelessWidget {
  const CollectionsList({
    required this.collections,
    required this.onDelete,
    required this.onOpen,
    super.key,
  });

  final List<CollectionModel> collections;

  final Future<void> Function({
    required CollectionModel collection,
  }) onOpen;

  final Future<void> Function({
    required String collectionID,
  }) onDelete;

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
        return CollectionsListCard(
          collection: collections[index],
          onDelete: onDelete,
          onOpen: onOpen,
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
