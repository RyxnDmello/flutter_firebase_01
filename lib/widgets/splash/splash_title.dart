import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashTitle extends StatelessWidget {
  const SplashTitle({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "./lib/images/collection/collection.png",
          fit: BoxFit.cover,
          width: 70,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          "TaskFlow",
          style: GoogleFonts.montserrat(
            color: Colors.white,
            letterSpacing: -2,
            fontSize: 65,
            height: 1,
          ),
        ),
      ],
    );
  }
}
