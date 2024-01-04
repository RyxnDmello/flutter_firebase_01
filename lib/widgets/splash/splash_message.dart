import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashMessage extends StatelessWidget {
  const SplashMessage({
    required this.message,
    super.key,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(
          strokeCap: StrokeCap.round,
          strokeAlign: -5,
          color: Colors.white,
          strokeWidth: 2.25,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          message,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
            color: Colors.white,
            letterSpacing: 0.5,
            fontSize: 25,
            height: 1,
          ),
        ),
      ],
    );
  }
}
