import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressFormPriority extends StatelessWidget {
  const ProgressFormPriority({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, Color> priority = {
      "HIGH": Colors.red,
      "MEDIUM": Colors.blue,
      "LOW": Colors.green,
    };

    return ListView.separated(
      itemCount: priority.length,
      itemBuilder: (context, index) {
        return Container(
          height: 125,
          width: double.infinity,
          color: priority.values.elementAt(index).withAlpha(100),
          decoration: BoxDecoration(
            border: Border.all(
              color: priority.values.elementAt(index),
              width: 2.5,
            ),
          ),
          child: Text(
            priority.keys.elementAt(index),
            style: GoogleFonts.abel(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 40,
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 20,
        );
      },
    );
  }
}
