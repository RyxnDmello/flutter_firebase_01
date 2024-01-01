import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../models/collection_model.dart';

List<BarChartGroupData> barChartGroups({
  required final Map<CollectionModel, List<int>> barData,
}) {
  final List<BarChartGroupData> barChartGroups = [];

  for (int X = 0; X < barData.length; X++) {
    barChartGroups.add(
      _group(
        values: barData.entries.elementAt(X).value,
        X: X,
      ),
    );
  }

  return barChartGroups;
}

BarChartGroupData _group({
  required List<int> values,
  required int X,
}) {
  const List<Color> rodColors = [
    Color.fromARGB(255, 0, 0, 180),
    Color.fromARGB(255, 200, 0, 0),
  ];

  return BarChartGroupData(
    x: X,
    barRods: [
      ...values.asMap().entries.map(
        (entry) {
          return _rod(
            color: rodColors[entry.key],
            toY: entry.value.toDouble(),
          );
        },
      ),
    ],
  );
}

BarChartRodData _rod({
  required Color color,
  required double toY,
}) {
  return BarChartRodData(
    color: color,
    toY: toY,
  );
}
