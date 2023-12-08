import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({
    required this.openForm,
    required this.isDark,
    required this.image,
    required this.label,
    required this.size,
    super.key,
  });

  final void Function() openForm;
  final String image;
  final String label;
  final bool isDark;
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
              foregroundColor: isDark ? Colors.white : Colors.black,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
            ),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: GoogleFonts.abel(
                color: isDark ? Colors.white : Colors.black,
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
