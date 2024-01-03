import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashMessage extends StatelessWidget {
  const SplashMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(
          strokeCap: StrokeCap.round,
          strokeAlign: -2.65,
          color: Colors.white,
          strokeWidth: 3,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          "Loading Collections...",
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: 1,
            fontSize: 25,
            height: 1,
          ),
        ),
      ],
    );
  }
}
