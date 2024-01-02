import '../models/collection_model.dart';

import './collection_manager.dart';
import './progress_manager.dart';
import './completed_manager.dart';

class _GraphsManager {
  const _GraphsManager();

  Future<Map<CollectionModel, List<int>>> get graphsData async {
    final collections = await collectionManager.collections;

    final Map<CollectionModel, List<int>> graphData = {};

    for (CollectionModel collection in collections) {
      final progress = await progressManager.tasks(
        collectionID: collection.id,
      );

      final completed = await completedManager.tasks(
        collectionID: collection.id,
      );

      graphData[collection] = [progress.length, completed.length];
    }

    return graphData;
  }

  Map<CollectionModel, int> convertToPieData({
    required Map<CollectionModel, List<int>> graphsData,
  }) {
    return graphsData.map((key, value) {
      return MapEntry(key, value.first);
    });
  }

  List<Map<CollectionModel, List<int>>> convertToBarData({
    required Map<CollectionModel, List<int>> graphsData,
  }) {
    List<Map<CollectionModel, List<int>>> pages = [];

    Map<CollectionModel, List<int>> temp = {};
    int start = 0;

    for (int i = 0; i < (graphsData.length / 5).ceil(); i++) {
      for (int j = start; j < start + 5; j++) {
        if (j == graphsData.length) break;

        temp[graphsData.keys.elementAt(j)] = graphsData.values.elementAt(j);
      }

      pages.insert(i, temp);
      start += 5;
      temp = {};
    }

    return pages;
  }
}

const graphsManager = _GraphsManager();
