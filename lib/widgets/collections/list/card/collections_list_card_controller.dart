import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CollectionsListCardController extends StatelessWidget {
  const CollectionsListCardController({
    required this.onDelete,
    required this.date,
    super.key,
  });

  final void Function() onDelete;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        OutlinedButton(
          onPressed: () => onDelete(),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 2.5,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            side: const BorderSide(
              color: Colors.white,
              width: 2,
            ),
            foregroundColor: Colors.white,
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
