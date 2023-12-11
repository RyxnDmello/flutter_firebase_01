import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Empty extends StatelessWidget {
  const Empty({
    required this.openForm,
    required this.image,
    required this.label,
    required this.size,
    super.key,
  });

  final void Function() openForm;
  final String image;
  final String label;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: size,
          ),
          TextButton(
            onPressed: () => openForm(),
            style: TextButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 50, 0, 150),
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 4,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              side: const BorderSide(
                color: Color.fromARGB(255, 50, 0, 150),
                width: 2.5,
              ),
            ),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: GoogleFonts.abel(
                color: const Color.fromARGB(255, 50, 0, 150),
                fontWeight: FontWeight.w600,
                letterSpacing: 1,
                fontSize: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
