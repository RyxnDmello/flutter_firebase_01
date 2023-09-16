import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressHeaderController extends StatelessWidget {
  const ProgressHeaderController({
    required this.openCompletedScreen,
    required this.clearCollection,
    super.key,
  });

  final void Function() openCompletedScreen;
  final void Function() clearCollection;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        OutlinedButton(
          onPressed: () => openCompletedScreen(),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 8,
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
            "Completed Tasks",
            style: GoogleFonts.abel(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              letterSpacing: 1.5,
              fontSize: 20,
            ),
          ),
        ),
        IconButton(
          onPressed: () => clearCollection(),
          iconSize: 30,
          icon: const Icon(
            Icons.delete_forever,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}