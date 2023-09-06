import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressTaskDate extends StatelessWidget {
  const ProgressTaskDate({
    required this.date,
    super.key,
  });

  final String date;

  @override
  Widget build(BuildContext context) {
    return Text(
      date,
      textAlign: TextAlign.right,
      style: GoogleFonts.abel(
        fontWeight: FontWeight.w600,
        color: Colors.white,
        letterSpacing: 1,
        fontSize: 16.5,
        height: 1,
      ),
    );
  }
}
