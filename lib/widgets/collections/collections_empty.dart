import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CollectionsEmpty extends StatelessWidget {
  const CollectionsEmpty({
    required this.openForm,
    required this.image,
    required this.label,
    super.key,
  });

  final void Function() openForm;
  final String image;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 300,
          ),
          TextButton(
            onPressed: () => openForm(),
            style: TextButton.styleFrom(
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              foregroundColor: Colors.black,
            ),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: GoogleFonts.abel(
                fontWeight: FontWeight.w600,
                color: Colors.black,
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
