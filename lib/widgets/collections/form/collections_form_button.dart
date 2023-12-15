import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CollectionsFormButton extends StatelessWidget {
  const CollectionsFormButton({
    required this.saveForm,
    required this.label,
    super.key,
  });

  final void Function() saveForm;
  final String label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => saveForm(),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 0, 0, 65),
        padding: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 10,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        elevation: 2,
      ),
      icon: const Icon(
        Icons.add,
        color: Colors.white,
        size: 28,
      ),
      label: Text(
        label,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          color: Colors.white,
          letterSpacing: 0.65,
          fontSize: 20,
        ),
      ),
    );
  }
}
