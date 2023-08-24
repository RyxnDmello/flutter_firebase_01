import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CollectionBlockName extends StatelessWidget {
  const CollectionBlockName({
    required this.name,
    super.key,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.work_outline_outlined,
          color: Colors.white,
          size: 35,
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
