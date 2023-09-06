import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressTaskTitle extends StatelessWidget {
  const ProgressTaskTitle({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: GoogleFonts.abel(
        fontWeight: FontWeight.w600,
        color: Colors.white,
        letterSpacing: 1.5,
        fontSize: 35,
        height: 1,
      ),
    );
  }
}
