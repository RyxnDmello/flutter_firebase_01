import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressFormDateCustom extends StatelessWidget {
  const ProgressFormDateCustom({
    required this.onSaveDate,
    required this.savedDate,
    super.key,
  });

  final Future<void> Function() onSaveDate;
  final String? savedDate;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSaveDate,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: savedDate != null
              ? const Color.fromARGB(100, 0, 0, 255)
              : const Color.fromARGB(25, 0, 0, 255),
          border: Border.all(
            color: const Color.fromARGB(255, 0, 0, 180),
            width: 2.5,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              savedDate ?? "Custom Date",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                color: Colors.black,
                letterSpacing: 0,
                fontSize: 22.5,
              ),
            ),
            Icon(
              savedDate != null ? Icons.timelapse : Icons.hourglass_empty,
              color: Colors.black,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
