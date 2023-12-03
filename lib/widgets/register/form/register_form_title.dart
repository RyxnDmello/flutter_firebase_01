import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterFormTitle extends StatelessWidget {
  const RegisterFormTitle({
    required this.heading,
    super.key,
  });

  final String heading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            heading,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w200,
              color: Colors.white,
              fontSize: 50,
              height: 1,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Account",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w300,
              color: Colors.white,
              fontSize: 65,
              height: 1,
            ),
          )
        ],
      ),
    );
  }
}
