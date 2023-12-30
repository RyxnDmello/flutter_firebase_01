import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../../models/collection_model.dart';

List<PieChartSectionData> pieChartSections({
  required Map<CollectionModel, int> pieData,
  required Color sectionColor,
}) {
  return pieData.entries.map((entry) {
    return _section(
      title: entry.value.toString(),
      value: entry.value.toDouble(),
      icon: entry.key.icon,
      color: sectionColor,
    );
  }).toList();
}

PieChartSectionData _section({
  required IconData icon,
  required String title,
  required double value,
  required Color color,
}) {
  return PieChartSectionData(
    titleStyle: GoogleFonts.montserrat(
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontSize: 20,
    ),
    badgeWidget: Icon(
      icon,
      color: Colors.black,
      size: 30,
    ),
    titlePositionPercentageOffset: 0.6,
    badgePositionPercentageOffset: 1.5,
    value: double.parse(title),
    title: title.toString(),
    color: color,
    radius: 65,
  );
}
