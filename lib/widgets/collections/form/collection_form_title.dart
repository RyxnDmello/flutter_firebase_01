import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CollectionFormTitle extends StatelessWidget {
  const CollectionFormTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Create Collection",
      style: GoogleFonts.abel(
        fontWeight: FontWeight.w600,
        color: const Color.fromARGB(255, 0, 0, 80),
        letterSpacing: 0.65,
        fontSize: 50,
      ),
    );
  }
}
