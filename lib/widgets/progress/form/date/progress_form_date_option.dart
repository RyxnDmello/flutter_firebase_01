import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressFormDateOption extends StatelessWidget {
  const ProgressFormDateOption({
    required this.onSelectDuration,
    required this.isSelected,
    required this.days,
    super.key,
  });

  final void Function() onSelectDuration;
  final bool isSelected;
  final int days;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelectDuration,
      child: Container(
        padding: const EdgeInsets.all(6.5),
        decoration: BoxDecoration(
          color: isSelected
              ? const Color.fromARGB(100, 0, 0, 255)
              : const Color.fromARGB(25, 0, 0, 255),
          border: Border.all(
            color: const Color.fromARGB(255, 0, 0, 180),
            width: 2.5,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Stack(
          children: [
            const Icon(
              Icons.timelapse,
              color: Colors.black,
              size: 30,
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Text(
                "${days}d",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  letterSpacing: 0.65,
                  fontSize: 25,
                  height: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
