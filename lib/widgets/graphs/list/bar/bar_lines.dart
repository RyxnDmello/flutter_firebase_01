import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

FlLine horizontalBarLines() {
  return const FlLine(
    gradient: LinearGradient(
      colors: [
        Colors.black26,
        Colors.black12,
      ],
    ),
    dashArray: [10, 5],
    strokeWidth: 4,
  );
}
