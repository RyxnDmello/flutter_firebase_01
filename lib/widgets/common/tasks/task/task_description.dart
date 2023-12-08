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
      style: GoogleFonts.abel(
        color: const Color.fromARGB(200, 255, 255, 255),
        letterSpacing: 1,
        fontSize: 20,
        height: 1,
      ),
    );
  }
}
