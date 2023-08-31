import 'package:flutter/material.dart';

import '../../models/collection_model.dart';

import '../../screens/progress.dart';

import './block/collection_block_image.dart';
import './block/collection_block_details.dart';
import './block/collection_block_name.dart';

class CollectionBlock extends StatelessWidget {
  const CollectionBlock({
    required this.collection,
    super.key,
  });

  final CollectionModel collection;

  @override
  Widget build(BuildContext context) {
    void viewTasks() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return ProgressScreen(
              collection: collection,
            );
          },
        ),
      );
    }

    return GestureDetector(
      onTap: () => viewTasks(),
      child: Container(
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
                    height: 6.5,
                  ),
                  CollectionBlockDetails(
                    progress: collection.progress,
                    completed: collection.completed,
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
