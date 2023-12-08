import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressFormTitle extends StatelessWidget {
  const ProgressFormTitle({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.task_alt_rounded,
          color: Colors.black,
          size: 45,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: GoogleFonts.abel(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            letterSpacing: 0.5,
            fontSize: 40,
          ),
        ),
      ],
    );
  }
}
