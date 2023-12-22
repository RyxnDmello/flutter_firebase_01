import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskDescription extends StatelessWidget {
  const TaskDescription({
    required this.description,
    super.key,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      softWrap: true,
      style: GoogleFonts.montserrat(
        color: const Color.fromARGB(255, 25, 25, 25),
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
        fontSize: 20,
        height: 1.25,
      ),
    );
  }
}
