import '../models/collection_model.dart';

import './collection_manager.dart';
import './progress_manager.dart';

class _GraphsManager {
  const _GraphsManager();

  Future<Map<CollectionModel, int>> get pieData async {
    final collections = await collectionManager.collections;

    final Map<CollectionModel, int> collectionGraphData = {};

    for (CollectionModel collection in collections) {
      final tasks = await progressManager.tasks(collectionID: collection.id);
      collectionGraphData[collection] = tasks.length;
    }

    return collectionGraphData;
  }
}

const graphsManager = _GraphsManager();
