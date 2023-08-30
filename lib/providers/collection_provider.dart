import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/collection_model.dart';

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

  List<CollectionModel> getCollections() {
    return state;
  }
}

final collectionProvider =
    StateNotifierProvider<CollectionNotifier, List<CollectionModel>>(
  (ref) => CollectionNotifier(),
);
