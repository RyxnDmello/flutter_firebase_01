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
      style: GoogleFonts.abel(
        fontWeight: FontWeight.w600,
        color: Colors.white,
        letterSpacing: 1.5,
        fontSize: 30,
        height: 1,
      ),
    );
  }
}
