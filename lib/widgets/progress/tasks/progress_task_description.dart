import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressTaskDescription extends StatelessWidget {
  const ProgressTaskDescription({
    required this.description,
    super.key,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: GoogleFonts.abel(
        color: Colors.white,
        letterSpacing: 1,
        fontSize: 20,
        height: 1,
      ),
    );
  }
}
