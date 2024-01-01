import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../database/collection_manager.dart';
import '../database/progress_manager.dart';
import '../database/completed_manager.dart';
import '../database/graphs_manager.dart';

import '../models/collection_model.dart';
import '../models/task_model.dart';

import '../widgets/common/empty.dart';
import '../widgets/common/loading_indicator.dart';

import '../widgets/collections/collections_header.dart';
import '../widgets/collections/collections_form.dart';
import '../widgets/collections/collections_list.dart';

import './progress.dart';
import './graphs.dart';

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
          onUpdate: _updateCollections,
        );
      },
    );
  }

  Future<void> _updateCollections() async {
    final collections = await collectionManager.collections;
    setState(() => _collections = collections);
  }

  Future<void> _openProgressScreen({
    required CollectionModel collection,
  }) async {
    showLoadingIndicator(
      context: context,
    );

    final progress = await progressManager.tasks(
      collectionID: collection.id,
    );

    final completed = await completedManager.tasks(
      collectionID: collection.id,
    );

    _closeLoadingIndicator();

    _progressScreen(
      collection: collection,
      progress: progress,
      completed: completed,
    );
  }

  Future<void> _deleteCollection({
    required String collectionID,
  }) async {
    showLoadingIndicator(
      context: context,
    );

    await collectionManager.deleteCollection(
      collectionID: collectionID,
    );

    await _updateCollections();
    _closeLoadingIndicator();
  }

  Future<void> _openGraphsScreen() async {
    showLoadingIndicator(
      context: context,
    );

    final graphsData = await graphsManager.graphsData;
    _closeLoadingIndicator();

    _graphsScreen(
      graphsData: graphsData,
    );
  }

  Future<void> _closeCollectionsScreen() async {
    await FirebaseAuth.instance.signOut();
  }

  void _progressScreen({
    required CollectionModel collection,
    required List<TaskModel> progress,
    required List<TaskModel> completed,
  }) {
    Navigator.of(context).push(
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
  }

  void _graphsScreen({
    required Map<CollectionModel, List<int>> graphsData,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => GraphsScreen(
          graphsData: graphsData,
        ),
      ),
    );
  }

  void _closeLoadingIndicator() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CollectionsHeader(
              background: "./lib/images/collection/background.png",
              image: "./lib/images/collection/collection.png",
              title: "Empty Collection",
              onClose: _closeCollectionsScreen,
              onRefresh: _updateCollections,
              onOpenForm: _openForm,
              onOpenGraph: _collections.isEmpty ? null : _openGraphsScreen,
            ),
            SizedBox(
              height: _collections.isEmpty ? 80 : 30,
            ),
            if (_collections.isEmpty)
              Empty(
                image: "./lib/images/collection/empty.png",
                label: "CREATE COLLECTION",
                openForm: _openForm,
                size: 300,
              ),
            if (_collections.isNotEmpty)
              CollectionsList(
                onOpen: _openProgressScreen,
                onDelete: _deleteCollection,
                collections: _collections,
              ),
          ],
        ),
      ),
    );
  }
}
