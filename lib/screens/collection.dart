import 'package:flutter/material.dart';

import '../models/collection_model.dart';

import '../widgets/collection/collection_app_bar.dart';
import '../widgets/collection/collection_block.dart';
import '../widgets/collection/collection_form.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
                context: context,
                builder: (context) {
                  return const CollectionForm();
                },
              );
            },
            icon: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        child: Column(
          children: [
            const CollectionAppBar(),
            const SizedBox(
              height: 20,
            ),
            ...collections.map(
              (collection) {
                return Column(
                  children: [
                    CollectionBlock(
                      collection: collection,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
