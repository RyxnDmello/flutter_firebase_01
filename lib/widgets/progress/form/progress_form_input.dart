import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressFormInput extends StatelessWidget {
  const ProgressFormInput({
    required this.validateInput,
    required this.saveInput,
    required this.maxLines,
    required this.label,
    super.key,
  });

  final String? Function(String input) validateInput;
  final void Function(String input) saveInput;
  final int? maxLines;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => validateInput(value!),
      onSaved: (newValue) => saveInput(newValue!),
      maxLines: maxLines,
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        color: Colors.black,
        letterSpacing: 1,
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
            color: Colors.red,
            width: 2.5,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.5,
          ),
        ),
        errorStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          color: Colors.red,
          letterSpacing: 0.65,
          fontSize: 12.5,
        ),
      ),
    );
  }
}
