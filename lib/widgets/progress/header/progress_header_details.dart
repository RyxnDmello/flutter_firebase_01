import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressHeaderDetails extends StatelessWidget {
  const ProgressHeaderDetails({
    required this.active,
    required this.percentage,
    super.key,
  });

  final String active;
  final String percentage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "$active Active",
          style: GoogleFonts.abel(
            color: Colors.white,
            letterSpacing: 1,
            fontSize: 25,
          ),
        ),
        Text(
          "$percentage% Completed",
          style: GoogleFonts.abel(
            color: Colors.white,
            letterSpacing: 1,
            fontSize: 25,
          ),
        ),
      ],
    );
  }
}
