import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressFormDateOption extends StatelessWidget {
  const ProgressFormDateOption({
    required this.onSelectOption,
    required this.isSelected,
    required this.duration,
    super.key,
  });

  final void Function() onSelectOption;
  final bool isSelected;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelectOption,
      child: Container(
        padding: const EdgeInsets.all(6.5),
        decoration: BoxDecoration(
          border: isSelected
              ? Border.all(
                  color: const Color.fromARGB(255, 0, 0, 180),
                  width: 2.5,
                )
              : null,
          color: Color.fromARGB(isSelected ? 40 : 30, 0, 0, 255),
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
                "${duration}d",
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
