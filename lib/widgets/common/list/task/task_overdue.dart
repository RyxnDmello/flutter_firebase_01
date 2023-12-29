import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskOverdue extends StatelessWidget {
  const TaskOverdue({
    required this.overdue,
    super.key,
  });

  final String overdue;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            offset: Offset(0, 2.5),
            blurRadius: 5,
          ),
        ],
        color: const Color.fromARGB(255, 200, 0, 0),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.timelapse,
                color: Colors.white,
                size: 25,
              ),
              const SizedBox(
                width: 6.5,
              ),
              Text(
                overdue,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  letterSpacing: 0.65,
                  fontSize: 20,
                ),
              ),
            ],
          ),
          Text(
            "OVERDUE",
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              letterSpacing: 0.65,
              fontSize: 20,
            ),
          )
        ],
      ),
    );
  }
}
