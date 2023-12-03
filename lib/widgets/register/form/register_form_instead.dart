import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterFormInstead extends StatelessWidget {
  const RegisterFormInstead({
    required this.switchForms,
    required this.message,
    required this.label,
    super.key,
  });

  final void Function() switchForms;
  final String message;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          message,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            color: Colors.white,
            letterSpacing: 0.65,
            fontSize: 20,
          ),
        ),
        TextButton(
          onPressed: () => switchForms(),
          child: Text(
            label,
            style: GoogleFonts.poppins(
              color: const Color.fromARGB(255, 0, 0, 255),
              letterSpacing: 0.65,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
