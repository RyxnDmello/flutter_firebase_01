import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.only(top: 60),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "./lib/images/register/background.png",
          ),
          fit: BoxFit.cover,
          opacity: 0.85,
        ),
      ),
      child: Row(
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
      ),
    );
  }
}
