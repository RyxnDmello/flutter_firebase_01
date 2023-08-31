import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressAppBar extends StatelessWidget {
  const ProgressAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Your Tasks",
      style: GoogleFonts.abel(
        color: const Color.fromARGB(255, 0, 0, 65),
        fontWeight: FontWeight.w600,
        fontSize: 65,
      ),
    );
  }
}
