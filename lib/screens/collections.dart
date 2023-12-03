import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../database/account_manager.dart';

import '../models/collection_model.dart';
import '../models/task_model.dart';

import '../widgets/collections/collections_header.dart';
import '../widgets/collections/collections_block.dart';
import '../widgets/collections/collections_form.dart';
import '../widgets/collections/collections_empty.dart';

import '../screens/progress.dart';

class CollectionsScreen extends StatefulWidget {
  const CollectionsScreen({
    required this.collections,
    super.key,
  });

  final List<CollectionModel>? collections;

  @override
  State<CollectionsScreen> createState() {
    return _CollectionScreenState();
  }
}

class _CollectionScreenState extends State<CollectionsScreen> {
  List<CollectionModel> _collections = [];

  @override
  void initState() {
    super.initState();

    if (widget.collections != null) return;
    _updateCollections();
  }

  Future<void> _updateCollections() async {
    final collections = await accountManager.getCollections();
    setState(() => _collections = collections);
  }

  void _openForm() {
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
        return CollectionForm(
          updateCollections: _updateCollections,
        );
      },
    );
  }

  Future<void> _openProgressScreen({
    required CollectionModel collection,
    required List<TaskModel> progress,
    required List<TaskModel> completed,
  }) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ProgressScreen(
            collection: collection,
            progress: progress,
            completed: completed,
          );
        },
      ),
    );

    _updateCollections();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () => FirebaseAuth.instance.signOut(),
          iconSize: 28,
          splashRadius: 25,
          color: Colors.white,
          icon: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async => await _updateCollections(),
            iconSize: 26.5,
            splashRadius: 25,
            color: Colors.white,
            icon: const Icon(
              Icons.refresh_outlined,
            ),
          ),
          IconButton(
            onPressed: () => _openForm(),
            iconSize: 30,
            splashRadius: 25,
            color: Colors.white,
            icon: const Icon(
              Icons.add,
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
            const CollectionsHeader(),
            const SizedBox(
              height: 20,
            ),
            if (_collections.isNotEmpty)
              ..._collections.map(
                (collection) {
                  return Column(
                    children: [
                      CollectionBlock(
                        openProgressScreen: _openProgressScreen,
                        updateCollections: _updateCollections,
                        collection: collection,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  );
                },
              ),
            if (_collections.isEmpty)
              CollectionEmpty(
                openForm: _openForm,
              ),
          ],
        ),
      ),
    );
  }
}
