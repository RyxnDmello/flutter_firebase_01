import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CollectionsHeaderTitle extends StatelessWidget {
  const CollectionsHeaderTitle({
    required this.image,
    required this.title,
    super.key,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          image,
          fit: BoxFit.cover,
          width: 45,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: 0,
            fontSize: 30,
          ),
        )
      ],
    );
  }
}
