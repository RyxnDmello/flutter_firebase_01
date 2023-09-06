import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressFormInput extends StatelessWidget {
  const ProgressFormInput({
    required this.label,
    super.key,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        color: Colors.black,
        fontSize: 25,
        height: 1.25,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(15, 25, 15, 15),
        label: Text(
          label,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 25,
            height: 0,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 2.5,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 2.5,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 2.5,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 2.5,
          ),
        ),
      ),
    );
  }
}
