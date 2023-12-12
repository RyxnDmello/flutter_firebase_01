import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CollectionsHeaderController extends StatelessWidget {
  const CollectionsHeaderController({
    required this.onOpenGraph,
    super.key,
  });

  final void Function() onOpenGraph;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        OutlinedButton.icon(
          onPressed: onOpenGraph,
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.only(
              right: 20,
              left: 20,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            side: const BorderSide(
              color: Colors.white,
              width: 2,
            ),
            foregroundColor: Colors.white,
          ),
          icon: const Icon(
            Icons.bar_chart,
            color: Colors.white,
            size: 30,
          ),
          label: Text(
            "Graphs",
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w500,
              color: Colors.white,
              letterSpacing: 0.65,
              fontSize: 20,
            ),
          ),
        ),
        Text(
          DateFormat("dd MMMM, yyyy").format(DateTime.now()),
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: 0.5,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
