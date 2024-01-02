import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/collection_model.dart';

import './pie/pie_data.dart';

class GraphsListPie extends StatelessWidget {
  const GraphsListPie({
    required this.onOpenScreen,
    required this.pieData,
    super.key,
  });

  final Map<CollectionModel, int> pieData;

  final void Function({
    required CollectionModel collection,
  }) onOpenScreen;

  @override
  Widget build(BuildContext context) {
    void onTapSection({
      required PieTouchResponse? response,
    }) {
      if (response == null) return;

      final touchedSectionIndex = response.touchedSection!.touchedSectionIndex;

      if (touchedSectionIndex == -1) return;

      onOpenScreen(
        collection: pieData.keys.elementAt(
          touchedSectionIndex,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Progress / Collection",
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
          child: PieChart(
            PieChartData(
              sections: pieChartSections(
                sectionColor: const Color.fromARGB(255, 0, 0, 100),
                pieData: pieData,
              ),
              pieTouchData: PieTouchData(
                touchCallback: (event, response) => onTapSection(
                  response: response,
                ),
              ),
              centerSpaceRadius: 50,
              sectionsSpace: 4,
            ),
          ),
        ),
      ],
    );
  }
}
