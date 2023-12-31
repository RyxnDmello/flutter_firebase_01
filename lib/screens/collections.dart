import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../database/collection_manager.dart';
import '../database/graphs_manager.dart';

import '../models/collection_model.dart';
import '../models/task_model.dart';

import '../widgets/common/empty.dart';

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

  Future<void> _updateCollections() async {
    final collections = await collectionManager.collections;
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

  Future<void> _openGraphsScreen() async {
    final graphsData = await graphsManager.graphsData;

    _graphsScreen(
      graphsData: graphsData,
    );
  }

  Future<void> _graphsScreen({
    required Map<CollectionModel, List<int>> graphsData,
  }) async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => GraphsScreen(
          graphsData: graphsData,
        ),
      ),
    );
  }

  Future<void> _closeCollectionsScreen() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CollectionsHeader(
          background: "./lib/images/collection/background.png",
          image: "./lib/images/collection/collection.png",
          title: "Empty Collection",
          onBack: _closeCollectionsScreen,
          onRefresh: _updateCollections,
          onOpenForm: _openForm,
          onOpenGraph: null,
        ),
        const SizedBox(
          height: 80,
        ),
        Empty(
          image: "./lib/images/collection/empty.png",
          label: "CREATE COLLECTION",
          openForm: _openForm,
          size: 300,
        ),
      ],
    );

    if (_collections.isNotEmpty) {
      content = Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CollectionsHeader(
            background: "./lib/images/collection/background.png",
            image: "./lib/images/collection/collection.png",
            title: "Your Collections",
            onBack: _closeCollectionsScreen,
            onOpenGraph: _openGraphsScreen,
            onRefresh: _updateCollections,
            onOpenForm: _openForm,
          ),
          const SizedBox(
            height: 40,
          ),
          CollectionsList(
            onOpenProgressScreen: _openProgressScreen,
            updateCollections: _updateCollections,
            collections: _collections,
          ),
        ],
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 40),
        child: content,
      ),
    );
  }
}
