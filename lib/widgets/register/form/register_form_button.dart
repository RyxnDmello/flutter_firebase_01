import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterFormButton extends StatelessWidget {
  const RegisterFormButton({
    required this.saveForm,
    required this.label,
    super.key,
  });

  final void Function() saveForm;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => saveForm(),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 0, 0, 180),
        minimumSize: const Size(double.infinity, 0),
        padding: const EdgeInsets.symmetric(
          vertical: 8,
        ),
      ),
      child: Text(
        label,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          color: Colors.white,
          letterSpacing: 1,
          fontSize: 20,
        ),
      ),
    );
  }
}
