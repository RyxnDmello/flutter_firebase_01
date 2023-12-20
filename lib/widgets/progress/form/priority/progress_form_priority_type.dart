import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressFormPriorityType extends StatelessWidget {
  const ProgressFormPriorityType({
    required this.isSelected,
    required this.type,
    super.key,
  });

  final bool isSelected;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isSelected)
          const Icon(
            Icons.check,
            size: 30,
            color: Colors.white,
          ),
        if (isSelected)
          const SizedBox(
            width: 8,
          ),
        Text(
          type,
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
