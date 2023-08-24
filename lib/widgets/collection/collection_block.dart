import 'package:flutter/material.dart';

import './block/collection_block_image.dart';
import './block/collection_block_details.dart';
import './block/collection_block_name.dart';

class CollectionBlock extends StatelessWidget {
  const CollectionBlock({
    required this.image,
    super.key,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
              image: image,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CollectionBlockName(
                    name: "Projects",
                  ),
                  SizedBox(
                    height: 6.5,
                  ),
                  CollectionBlockDetails()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
