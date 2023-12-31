import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/collection_model.dart';

import './bar/bar_data.dart';
import './bar/bar_tiles.dart';

class GraphsListBar extends StatelessWidget {
  const GraphsListBar({
    required this.barData,
    super.key,
  });

  final Map<CollectionModel, List<int>> barData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Progress & Completed",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 25,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        SizedBox(
          height: 250,
          width: double.infinity,
          child: BarChart(
            BarChartData(
              barGroups: barChartGroups(
                barData: barData,
              ),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: bottomSideTiles(
                    collections: barData.keys.toList(),
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: leftSideTiles(),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  ),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  ),
                ),
              ),
              barTouchData: BarTouchData(enabled: false),
              gridData: const FlGridData(show: false),
              borderData: FlBorderData(show: false),
            ),
          ),
        ),
      ],
    );
  }
}
