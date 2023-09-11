import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../database/account_manager.dart';

import '../models/collection_model.dart';

const _uuid = Uuid();

class CollectionNotifier extends StateNotifier<List<CollectionModel>> {
  CollectionNotifier() : super([]);

  Future<void> addCollection({
    required String name,
    required IconData icon,
    required String image,
  }) async {
    final collection = CollectionModel(
      id: _uuid.v4(),
      name: name,
      icon: icon,
      image: image,
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
}

final collectionProvider =
    StateNotifierProvider<CollectionNotifier, List<CollectionModel>>(
  (ref) => CollectionNotifier(),
);
