import 'package:flutter/material.dart';

import '../../database/graphs_manager.dart';

import '../../models/collection_model.dart';

import './list/graphs_list_pie.dart';
import './list/graphs_list_bar.dart';

class GraphsList extends StatelessWidget {
  const GraphsList({
    required this.onOpenScreen,
    required this.graphsData,
    super.key,
  });

  final Map<CollectionModel, List<int>> graphsData;

  final void Function({
    required CollectionModel collection,
  }) onOpenScreen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GraphsListPie(
            pieData: graphsManager.convertToPieData(
              graphsData: graphsData,
            ),
            onOpenScreen: onOpenScreen,
          ),
          SizedBox(
            height: graphsData.length > 2 ? 60 : 20,
          ),
          GraphsListBar(
            barData: graphsManager.convertToBarData(
              graphsData: graphsData,
            ),
          ),
        ],
      ),
    );
  }
}
