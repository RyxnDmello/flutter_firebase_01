import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressEmpty extends StatelessWidget {
  const ProgressEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "./lib/images/progress/empty.png",
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "ADD YOUR TASKS",
            style: GoogleFonts.abel(
              color: const Color.fromARGB(255, 0, 0, 65),
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              fontSize: 35,
            ),
          ),
        ),
      ],
    );
  }
}
