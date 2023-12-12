import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../database/account_manager.dart';

import '../models/collection_model.dart';
import '../models/task_model.dart';

import '../widgets/common/empty.dart';

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
          onBack: _closeCollectionsScreen,
          onRefresh: _updateCollections,
          title: "Empty Collection",
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
            onBack: _closeCollectionsScreen,
            onRefresh: _updateCollections,
            title: "Your Collections",
            onOpenForm: _openForm,
            onOpenGraph: () {},
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
        physics: const BouncingScrollPhysics(),
        child: content,
      ),
    );
  }
}
