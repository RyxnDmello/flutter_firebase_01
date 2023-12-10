import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskTitle extends StatelessWidget {
  const TaskTitle({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.montserrat(
        fontWeight: FontWeight.w500,
        color: Colors.white,
        letterSpacing: 0,
        fontSize: 28,
        height: 1,
      ),
    );
  }
}
