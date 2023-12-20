import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskHeaderPriority extends StatelessWidget {
  const TaskHeaderPriority({
    required this.priorityColor,
    required this.priorityType,
    super.key,
  });

  final String priorityType;
  final Color priorityColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 2.5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(0, 2.5),
            blurRadius: 5,
          ),
        ],
        color: priorityColor,
      ),
      child: Text(
        priorityType,
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w500,
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
