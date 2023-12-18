import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../../models/collection_model.dart';

List<PieChartSectionData> pieChartSections({
  required Map<CollectionModel, int> collections,
  required Color sectionColor,
}) {
  return collections.entries.map((entry) {
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
      fontWeight: FontWeight.w600,
      color: Colors.black,
      fontSize: 16,
      height: 1,
    ),
    badgeWidget: Icon(
      icon,
      color: Colors.black,
      size: 30,
    ),
    borderSide: BorderSide(
      color: color,
      width: 2.5,
    ),
    titlePositionPercentageOffset: 0.65,
    badgePositionPercentageOffset: 1.5,
    color: color.withAlpha(100),
    value: double.parse(title),
    title: title.toString(),
    radius: 65,
  );
}
