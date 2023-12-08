import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CollectionsFormInput extends StatelessWidget {
  const CollectionsFormInput({
    required this.validateInput,
    required this.saveInput,
    required this.label,
    super.key,
  });

  final String? Function(String name) validateInput;
  final void Function(String name) saveInput;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => validateInput(value!),
      onSaved: (newValue) => saveInput(newValue!),
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w500,
        color: Colors.black,
        letterSpacing: 1,
        fontSize: 25,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        label: Text(
          label,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 25,
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
            color: Color.fromARGB(255, 200, 0, 0),
            width: 2.5,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 200, 0, 0),
            width: 2.5,
          ),
        ),
        errorStyle: GoogleFonts.poppins(
          color: const Color.fromARGB(255, 200, 0, 0),
          fontWeight: FontWeight.w600,
          letterSpacing: 0.65,
          fontSize: 12.5,
        ),
      ),
    );
  }
}
