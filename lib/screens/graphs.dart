import 'package:flutter/material.dart';

import '../models/collection_model.dart';

import '../widgets/graphs/graphs_header.dart';
import '../widgets/graphs/graphs_list.dart';

class GraphsScreen extends StatelessWidget {
  const GraphsScreen({
    required this.pieData,
    super.key,
  });

  final Map<CollectionModel, int> pieData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const GraphsHeader(
              image: "./lib/images/collection/background.png",
              title: "Graphs & Analytics",
            ),
            const SizedBox(
              height: 40,
            ),
            GraphsList(
              pieData: pieData,
            ),
          ],
        ),
      ),
    );
  }
}
