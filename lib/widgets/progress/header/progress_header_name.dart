import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressHeaderName extends StatelessWidget {
  const ProgressHeaderName({
    required this.name,
    required this.icon,
    super.key,
  });

  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 35,
        ),
        const SizedBox(
          width: 6.5,
        ),
        Text(
          name,
          style: GoogleFonts.abel(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            letterSpacing: 2,
            fontSize: 30,
          ),
        )
      ],
    );
  }
}
