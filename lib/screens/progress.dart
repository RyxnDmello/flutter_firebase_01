import 'package:flutter/material.dart';

import '../models/collection_model.dart';

import '../widgets/progress/progress_app_bar.dart';
import '../widgets/progress/progress_form.dart';
import '../widgets/progress/progress_empty.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({
    required this.collection,
    super.key,
  });

  final CollectionModel collection;

  @override
  Widget build(BuildContext context) {
    void openForm() {
      showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (context) {
          return const ProgressForm();
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () => openForm(),
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
                if (collection.progress.isEmpty)
                  ProgressEmpty(
                    openForm: openForm,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
