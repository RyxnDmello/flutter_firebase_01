import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressFormPriorityDuration extends StatelessWidget {
  const ProgressFormPriorityDuration({
    required this.duration,
    super.key,
  });

  final String duration;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.timelapse,
          size: 30,
          color: Colors.white,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          duration,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: 1,
            fontSize: 24,
          ),
        ),
      ],
    );
  }
}
