import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CollectionBlockName extends StatelessWidget {
  const CollectionBlockName({
    required this.name,
    required this.icon,
    super.key,
  });

  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          color: Colors.white,
          size: 35,
          icon,
        ),
        const SizedBox(
          width: 6.5,
        ),
        Text(
          name.toUpperCase(),
          style: GoogleFonts.abel(
            color: Colors.white,
            letterSpacing: 2,
            fontSize: 30,
          ),
        )
      ],
    );
  }
}
