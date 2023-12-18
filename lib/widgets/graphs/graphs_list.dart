import 'package:flutter/material.dart';

import '../../models/collection_model.dart';

import './list/graphs_list_pie.dart';

class GraphsList extends StatelessWidget {
  const GraphsList({
    required this.collections,
    super.key,
  });

  final Map<CollectionModel, int> collections;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        GraphsListPie(
          collections: collections,
        ),
      ],
    );
  }
}
