import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskHeaderDuration extends StatelessWidget {
  const TaskHeaderDuration({
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
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          duration,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
