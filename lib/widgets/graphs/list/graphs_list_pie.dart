import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/collection_model.dart';

import './data/pie_data.dart';

class GraphsListPie extends StatelessWidget {
  const GraphsListPie({
    required this.collections,
    super.key,
  });

  final Map<CollectionModel, int> collections;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Collections",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            letterSpacing: 0,
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
                sectionColor: const Color.fromARGB(255, 0, 0, 255),
                collections: collections,
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
