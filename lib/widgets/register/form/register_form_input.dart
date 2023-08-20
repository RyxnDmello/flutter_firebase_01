import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterFormInput extends StatelessWidget {
  const RegisterFormInput({
    required this.validateInput,
    required this.isProtected,
    required this.saveInput,
    required this.inputType,
    required this.label,
    super.key,
  });

  final String? Function(String? input) validateInput;
  final void Function(String? input) saveInput;
  final TextInputType inputType;
  final bool isProtected;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => validateInput(value),
      onSaved: (newValue) => saveInput(newValue),
      keyboardType: inputType,
      obscureText: isProtected,
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w300,
        color: Colors.white,
        letterSpacing: 0.5,
        fontSize: 20,
        height: 1.5,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(12.5, 15, 15, 15),
        label: Text(
          label,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w300,
            color: Colors.white,
            letterSpacing: 0.5,
            fontSize: 25,
            height: 0,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 1.5,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 1.5,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 200, 0, 0),
            width: 1.5,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 200, 0, 0),
            width: 1.5,
          ),
        ),
        errorStyle: GoogleFonts.poppins(
          color: const Color.fromARGB(255, 200, 0, 0),
          fontWeight: FontWeight.w500,
          letterSpacing: 1,
          fontSize: 15,
          height: 1.25,
        ),
      ),
    );
  }
}
