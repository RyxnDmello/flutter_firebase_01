import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressHeaderController extends StatelessWidget {
  const ProgressHeaderController({
    required this.openCompletedScreen,
    required this.clearCollection,
    super.key,
  });

  final Future<void> Function() clearCollection;
  final void Function() openCompletedScreen;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () => openCompletedScreen(),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
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
          onPressed: () async => await clearCollection(),
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
