import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../models/collection_model.dart';

SideTitles bottomSideTiles({
  required List<CollectionModel> collections,
}) {
  return SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      return Padding(
        padding: const EdgeInsets.only(
          top: 8,
        ),
        child: Icon(
          collections[value.toInt()].icon,
          color: Colors.black,
        ),
      );
    },
  );
}

SideTitles leftSideTiles() {
  return SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      if (value.toInt() < value) {
        return const Text("");
      }

      return Text(
        value.floor().toString(),
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w600,
          color: Colors.black,
          letterSpacing: 1,
          fontSize: 18,
        ),
      );
    },
  );
}
