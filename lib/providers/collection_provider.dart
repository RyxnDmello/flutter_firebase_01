import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../database/account_manager.dart';

import '../models/collection_model.dart';

final _date = DateFormat.yMMMMd('en_US').format(DateTime.now());
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
      date: _date,
      image: image,
    );

    await accountManager.addCollection(
      collection: collection,
    );

    state = [...state, collection];
  }

  Future<void> deleteCollection({required String collectionID}) async {
    await accountManager.deleteCollection(
      collectionID: collectionID,
    );
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
