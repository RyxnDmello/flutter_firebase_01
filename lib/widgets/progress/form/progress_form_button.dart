import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressFormButton extends StatelessWidget {
  const ProgressFormButton({
    required this.saveForm,
    super.key,
  });

  final void Function() saveForm;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => saveForm(),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 0, 0, 65),
        minimumSize: const Size(double.infinity, 50),
        shadowColor: Colors.black,
        elevation: 2,
      ),
      icon: const Icon(
        Icons.add,
        color: Colors.white,
        size: 30,
      ),
      label: Text(
        "Create Task",
        style: GoogleFonts.poppins(
          color: Colors.white,
          letterSpacing: 0.65,
          fontSize: 22.5,
        ),
      ),
    );
  }
}
