import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CompletedHeaderController extends StatelessWidget {
  const CompletedHeaderController({
    required this.closeCompletedScreen,
    required this.totalTasks,
    super.key,
  });

  final void Function() closeCompletedScreen;
  final int totalTasks;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        OutlinedButton(
          onPressed: () => closeCompletedScreen(),
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
            "Progress Tasks",
            style: GoogleFonts.abel(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              letterSpacing: 1.5,
              fontSize: 20,
            ),
          ),
        ),
        Text(
          "$totalTasks Tasks",
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
