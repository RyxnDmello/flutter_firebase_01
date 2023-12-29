import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CollectionsListCardName extends StatelessWidget {
  const CollectionsListCardName({
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
          width: 10,
        ),
        Text(
          name,
          style: GoogleFonts.abel(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 30,
          ),
        )
      ],
    );
  }
}
