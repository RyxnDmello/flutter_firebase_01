import 'package:flutter/material.dart';

import '../models/collection_model.dart';

import '../widgets/progress/progress_app_bar.dart';
import '../widgets/progress/progress_empty.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({
    required this.collection,
    super.key,
  });

  final CollectionModel collection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          ProgressAppBar(
            collection: collection,
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (collection.progress.isEmpty) const ProgressEmpty(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
