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

  Map<CollectionModel, int> convertToPieData(
    Map<CollectionModel, List<int>> graphsData,
  ) {
    return graphsData.map((key, value) {
      return MapEntry(key, value.first);
    });
  }
}

const graphsManager = _GraphsManager();
