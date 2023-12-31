import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/collection_model.dart';

import './pie/pie_data.dart';

class GraphsListPie extends StatelessWidget {
  const GraphsListPie({
    required this.pieData,
    super.key,
  });

  final Map<CollectionModel, int> pieData;

  @override
  Widget build(BuildContext context) {
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
              centerSpaceRadius: 50,
              sectionsSpace: 4,
            ),
          ),
        ),
      ],
    );
  }
}
