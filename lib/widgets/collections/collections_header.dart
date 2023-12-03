import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CollectionsHeader extends StatelessWidget {
  const CollectionsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Explore Your",
          style: GoogleFonts.abel(
            color: const Color.fromARGB(255, 0, 0, 65),
            fontWeight: FontWeight.w600,
            fontSize: 60,
          ),
        ),
        Text(
          "Collections",
          style: GoogleFonts.abel(
            color: const Color.fromARGB(255, 0, 0, 65),
            fontWeight: FontWeight.w600,
            fontSize: 80,
            height: 1,
          ),
        ),
      ],
    );
  }
}
