import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterAppBar extends StatelessWidget {
  const RegisterAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "./lib/images/register/background.png",
          ),
          fit: BoxFit.cover,
          opacity: 0.85,
        ),
      ),
      height: 250,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 60),
      child: Center(
        child: Text(
          "TaskFlow",
          style: GoogleFonts.abel(
            color: Colors.white,
            fontSize: 100,
          ),
        ),
      ),
    );
  }
}
