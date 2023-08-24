import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CollectionBlockDetails extends StatelessWidget {
  const CollectionBlockDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "25 Tasks",
          style: GoogleFonts.abel(
            color: Colors.white,
            letterSpacing: 1,
            fontSize: 25,
          ),
        ),
        Text(
          "50% Done",
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
