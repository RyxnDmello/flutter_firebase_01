import 'package:flutter/material.dart';

import '../../../models/collection_model.dart';

import './card/collections_list_card_name.dart';
import './card/collections_list_card_controller.dart';

class CollectionsListCard extends StatelessWidget {
  const CollectionsListCard({
    required this.collection,
    required this.onDelete,
    required this.onOpen,
    super.key,
  });

  final CollectionModel collection;

  final Future<void> Function({
    required CollectionModel collection,
  }) onOpen;

  final Future<void> Function({
    required String collectionID,
  }) onDelete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => await onOpen(
        collection: collection,
      ),
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
              onDelete: () async => await onDelete(
                collectionID: collection.id,
              ),
              date: collection.date,
            ),
          ],
        ),
      ),
    );
  }
}
