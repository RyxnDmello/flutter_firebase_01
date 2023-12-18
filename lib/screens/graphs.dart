import 'package:flutter/material.dart';

import '../models/collection_model.dart';

import '../widgets/graphs/graphs_list.dart';

class GraphsScreen extends StatelessWidget {
  const GraphsScreen({
    required this.collections,
    super.key,
  });

  final Map<CollectionModel, int> collections;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GraphsList(
              collections: collections,
            ),
          ],
        ),
      ),
    );
  }
}
