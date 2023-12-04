import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CollectionsHeader extends StatelessWidget {
  const CollectionsHeader({
    required this.image,
    super.key,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
            width: 120,
          ),
          const SizedBox(
            width: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Explore",
                style: GoogleFonts.abel(
                  color: const Color.fromARGB(255, 0, 0, 65),
                  fontWeight: FontWeight.w600,
                  fontSize: 50,
                  height: 1,
                ),
              ),
              const SizedBox(
                height: 2.5,
              ),
              Text(
                "Collections",
                style: GoogleFonts.abel(
                  color: const Color.fromARGB(255, 0, 0, 65),
                  fontWeight: FontWeight.w600,
                  fontSize: 50,
                  height: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
