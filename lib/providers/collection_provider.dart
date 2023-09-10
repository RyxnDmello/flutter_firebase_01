import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/account_manager.dart';

import '../models/collection_model.dart';
import '../models/task_model.dart';

class CollectionNotifier extends StateNotifier<List<CollectionModel>> {
  CollectionNotifier() : super([]);

  Future<void> addCollection({
    required String name,
    required IconData icon,
    required String image,
  }) async {
    final collection = CollectionModel(
      name: name,
      icon: icon,
      image: image,
      progress: [],
      completed: [],
    );

    await accountManager.addCollection(
      collection: collection,
    );

    state = [...state, collection];
  }

  Future<List<CollectionModel>> getCollections() async {
    state = [...await accountManager.getCollections()];
    return state;
  }

  Future<void> addProgressTask({
    required CollectionModel collection,
    required TaskModel task,
  }) async {
    await accountManager.addProgressTask(
      collection: collection,
      task: task,
    );
  }
}

final collectionProvider =
    StateNotifierProvider<CollectionNotifier, List<CollectionModel>>(
  (ref) => CollectionNotifier(),
);
