import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashDescription extends StatelessWidget {
  const SplashDescription({
    required this.description,
    super.key,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: GoogleFonts.montserrat(
        fontWeight: FontWeight.w600,
        color: Colors.white,
        letterSpacing: 1,
        fontSize: 28,
      ),
    );
  }
}
