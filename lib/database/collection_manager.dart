import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import './account_manager.dart';

import '../models/collection_model.dart';

final _date = DateFormat.yMMMMd('en_US').format(DateTime.now());
const _uuid = Uuid();

class _CollectionManager {
  _CollectionManager() : _account = null;

  DocumentReference? _account;

  Future<void> createCollection({
    required String name,
    required String image,
    required IconData icon,
  }) async {
    _account = accountManager.account;

    await _account!.collection("collections").doc(_uuid.v4()).set(
      {
        "name": name,
        "image": image,
        "icon": icon.codePoint,
        "date": _date,
      },
    );
  }

  Future<void> deleteCollection({required String collectionID}) async {
    _account = accountManager.account;
    await _account!.collection("collections").doc(collectionID).delete();
  }

  Future<List<CollectionModel>> get collections async {
    _account = accountManager.account;

    final dbCollections = await _account!.collection("collections").get();

    if (dbCollections.docs.isEmpty) return [];

    return dbCollections.docs.map((collection) {
      return CollectionModel(
        id: collection.id,
        name: collection.data()["name"],
        icon: IconData(
          collection.data()["icon"],
          fontFamily: "MaterialIcons",
        ),
        image: collection.data()["image"],
        date: collection.data()["date"],
      );
    }).toList();
  }
}

final collectionManager = _CollectionManager();
