import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CollectionsFormTitle extends StatelessWidget {
  const CollectionsFormTitle({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.create_outlined,
          color: Colors.black,
          size: 45,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          title,
          style: GoogleFonts.abel(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            letterSpacing: 0,
            fontSize: 40,
          ),
        ),
      ],
    );
  }
}
