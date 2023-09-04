import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressFormTitle extends StatelessWidget {
  const ProgressFormTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Add Your Task",
      style: GoogleFonts.abel(
        color: const Color.fromARGB(255, 0, 0, 80),
        fontWeight: FontWeight.w600,
        letterSpacing: 0.65,
        fontSize: 50,
      ),
    );
  }
}
