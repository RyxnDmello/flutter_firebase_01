import 'package:flutter/material.dart';

import '../../models/collection_model.dart';

import './list/graphs_list_pie.dart';

class GraphsList extends StatelessWidget {
  const GraphsList({
    required this.pieData,
    super.key,
  });

  final Map<CollectionModel, int> pieData;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      physics: const NeverScrollableScrollPhysics(),
      children: [
        GraphsListPie(
          pieData: pieData,
        ),
      ],
    );
  }
}
