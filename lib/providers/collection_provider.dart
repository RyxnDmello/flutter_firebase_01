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

  void addTask({
    required CollectionModel collection,
    required TaskModel task,
  }) {
    for (var i = 0; i < state.length; i++) {
      if (state[i] != collection) continue;
      state[i].progress.add(task);
      return;
    }
  }

  List<TaskModel> getProgress({required CollectionModel collection}) {
    for (var i = 0; i < state.length; i++) {
      if (state[i] != collection) continue;
      return state[i].progress;
    }

    return [];
  }
}

final collectionProvider =
    StateNotifierProvider<CollectionNotifier, List<CollectionModel>>(
  (ref) => CollectionNotifier(),
);
