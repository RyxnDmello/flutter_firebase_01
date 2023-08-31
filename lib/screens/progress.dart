import 'package:flutter/material.dart';

import '../models/collection_model.dart';

import '../widgets/progress/progress_app_bar.dart';

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
      body: const SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        child: Column(
          children: [
            ProgressAppBar(),
          ],
        ),
      ),
    );
  }
}
