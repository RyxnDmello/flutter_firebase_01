import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CollectionBlockController extends StatelessWidget {
  const CollectionBlockController({
    required this.deleteCollection,
    required this.date,
    super.key,
  });

  final void Function() deleteCollection;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        OutlinedButton(
          onPressed: () => deleteCollection(),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 5,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            side: const BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
          child: Text(
            "Delete",
            style: GoogleFonts.abel(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              letterSpacing: 2,
              fontSize: 20,
            ),
          ),
        ),
        Text(
          date.toUpperCase(),
          style: GoogleFonts.abel(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
