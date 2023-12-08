import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../database/account_manager.dart';

import '../models/collection_model.dart';
import '../models/task_model.dart';

import '../widgets/common/empty_list.dart';

import '../widgets/collections/collections_header.dart';
import '../widgets/collections/collections_form.dart';
import '../widgets/collections/collections_list.dart';

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
        return CollectionsForm(
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
    Widget collections = SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      child: Column(
        children: [
          const CollectionsHeader(
            image: "./lib/images/collection/collection.png",
          ),
          const SizedBox(
            height: 30,
          ),
          CollectionsList(
            updateCollections: _updateCollections,
            onOpenProgressScreen: _openProgressScreen,
            collections: _collections,
          ),
        ],
      ),
    );

    if (_collections.isEmpty) {
      collections = SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 140,
        ),
        child: EmptyList(
          image: "./lib/images/collection/empty.png",
          label: "CREATE COLLECTIONS",
          openForm: _openForm,
          isDark: false,
          size: 300,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () => FirebaseAuth.instance.signOut(),
          iconSize: 28,
          splashRadius: 25,
          color: Colors.white,
          icon: const Icon(
            Icons.close,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => _openForm(),
            iconSize: 25,
            splashRadius: 25,
            color: Colors.white,
            icon: const Icon(
              Icons.create,
            ),
          ),
        ],
      ),
      body: collections,
    );
  }
}
