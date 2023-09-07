import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/collection_model.dart';
import '../models/task_model.dart';

class CollectionNotifier extends StateNotifier<List<CollectionModel>> {
  CollectionNotifier() : super([]);

  void addCollection({
    required String name,
    required IconData icon,
    required String image,
  }) {
    state = [
      ...state,
      CollectionModel(
        name: name,
        icon: icon,
        image: image,
        progress: [],
        completed: [],
      )
    ];
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

  List<CollectionModel> getCollections() {
    return state;
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
