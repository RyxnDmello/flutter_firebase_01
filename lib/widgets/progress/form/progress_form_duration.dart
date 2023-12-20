import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressFormDuration extends StatelessWidget {
  const ProgressFormDuration({
    required this.onSaveBackground,
    required this.selectedIndex,
    required this.title,
    super.key,
  });

  final int selectedIndex;
  final String title;

  final void Function({
    required int index,
  }) onSaveBackground;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: GoogleFonts.abel(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            letterSpacing: 0.5,
            fontSize: 35,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
