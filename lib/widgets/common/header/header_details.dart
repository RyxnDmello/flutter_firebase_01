import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderDetails extends StatelessWidget {
  const HeaderDetails({
    required this.percentage,
    required this.active,
    super.key,
  });

  final String percentage;
  final String active;

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
            letterSpacing: 0.5,
            fontSize: 25,
          ),
        ),
        Text(
          "$percentage% Completed",
          style: GoogleFonts.abel(
            color: Colors.white,
            letterSpacing: 0.5,
            fontSize: 25,
          ),
        ),
      ],
    );
  }
}
