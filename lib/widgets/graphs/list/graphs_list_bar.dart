import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/collection_model.dart';

import './bar/bar_data.dart';
import './bar/bar_tiles.dart';
import './bar/bar_lines.dart';
import './bar/bar_controller.dart';

class GraphsListBar extends StatefulWidget {
  const GraphsListBar({
    required this.barData,
    super.key,
  });

  final List<Map<CollectionModel, List<int>>> barData;

  @override
  State<GraphsListBar> createState() => _GraphsListBarState();
}

class _GraphsListBarState extends State<GraphsListBar>
    with TickerProviderStateMixin {
  final PageController _pageController = PageController(initialPage: 0);
  List<Map<CollectionModel, List<int>>> _barData = [];
  int _index = 0;

  @override
  initState() {
    super.initState();
    _barData = widget.barData;
  }

  void _tabIndicator({required changedIndex}) {
    setState(() => _index = changedIndex);
  }

  void _switchPageRight() {
    if (_index == _barData.length - 1) return;

    setState(() => ++_index);
    _switchPages();
  }

  void _switchPageLeft() {
    if (_index == 0) return;

    setState(() => --_index);
    _switchPages();
  }

  void _switchPages() {
    _pageController.animateToPage(
      _index,
      curve: Curves.ease,
      duration: const Duration(
        milliseconds: 450,
      ),
    );
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
            onPageChanged: (index) => _tabIndicator(
              changedIndex: index,
            ),
            controller: _pageController,
            itemCount: _barData.length,
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
                      barData: _barData.elementAt(index),
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
                          collections: _barData.elementAt(index).keys.toList(),
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
        const SizedBox(
          height: 20,
        ),
        if (_barData.length > 1)
          BarController(
            onTapRight: _switchPageRight,
            onTapLeft: _switchPageLeft,
            totalTabs: _barData.length,
            tabIndex: _index,
            vsync: this,
          ),
      ],
    );
  }
}
