import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressEmpty extends StatelessWidget {
  const ProgressEmpty({
    required this.openForm,
    super.key,
  });

  final void Function() openForm;

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
          onPressed: () => openForm(),
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
