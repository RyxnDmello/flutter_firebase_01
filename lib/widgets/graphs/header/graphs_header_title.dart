import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GraphsHeaderTitle extends StatelessWidget {
  const GraphsHeaderTitle({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Icon(
          Icons.bar_chart,
          color: Colors.white,
          size: 45,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: 0,
            fontSize: 30,
          ),
        ),
      ],
    );
  }
}
