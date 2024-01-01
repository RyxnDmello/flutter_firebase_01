import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/collection_model.dart';

import './bar/bar_data.dart';
import './bar/bar_tiles.dart';
import './bar/bar_lines.dart';

class GraphsListBar extends StatefulWidget {
  const GraphsListBar({
    required this.barData,
    super.key,
  });

  final Map<CollectionModel, List<int>> barData;

  @override
  State<GraphsListBar> createState() => _GraphsListBarState();
}

class _GraphsListBarState extends State<GraphsListBar> {
  Map<CollectionModel, List<int>> _barData = {};

  @override
  initState() {
    super.initState();
    _barData = widget.barData;
  }

  List<Map<CollectionModel, List<int>>> get _barDataPages {
    List<Map<CollectionModel, List<int>>> pages = [];

    Map<CollectionModel, List<int>> temp = {};
    int start = 0;

    for (int i = 0; i < (_barData.length / 5).ceil(); i++) {
      for (int j = start; j < start + 5; j++) {
        if (j == _barData.length) break;

        temp[_barData.keys.elementAt(j)] = _barData.values.elementAt(j);
      }

      pages.insert(i, temp);
      start += 5;
      temp = {};
    }

    return pages;
  }

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
          height: 25,
        ),
        SizedBox(
          height: 250,
          width: double.infinity,
          child: PageView.builder(
            itemCount: _barDataPages.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                  top: 10,
                ),
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    barGroups: barChartGroups(
                      barData: _barDataPages.elementAt(index),
                    ),
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      getDrawingHorizontalLine: (value) {
                        return horizontalBarLines();
                      },
                    ),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: bottomSideTiles(
                          collections: widget.barData.keys.toList(),
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
                    borderData: FlBorderData(show: false),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
